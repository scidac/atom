#!/usr/bin/env python
import sys
import re
import os
import subprocess

omfit_root = os.getenv('OMFIT_ROOT', "./OMFIT-source/")
atom_wiki_root = os.getenv('ATOM_WIKI_ROOT', "./atom.wiki/")
output_path = "../src/components/"


def get_section_defaults():
    return {"Component": "",
            "Short Description": "",
            "Type": "",
            "Contact(s)": "",
            "Keywords": "",
            "Description": "",
            "Install": "",
            "Documentation": "",
            "Workflows": "",
            "OMFIT Integration": "",
            "IPS Integration": "",
            "Performance": "",
            "Imports From": "",
            "Exports To": "",
            "Publications": "",
            "License": ""}


def chart_section_to_atom(term):
    try:
        return {"Component": "Component",
                "Is AToM": "Is AToM",
                "Packaging": "Install",
                "OMFIT Bind": "OMFIT Integration",
                "IPS Bind": "IPS Integration",
                "Contact(s)": "Contact(s)",
                "Installs": "Install",
                "Code Home": "Install",
                "Docs Home": "Documentation"}[term]
    except:
        return term


def omfit_section_to_atom(term):
    try:
        return {"Short Description": "Short Description",
                "Keywords": "Keywords",
                "Long Description": "Description",
                "Typical workflows": "Workflows",
                "Tutorials": "Documentation",
                "Relevant publications": "Publications",
                "External resources": "Documentation",
                "Technical info": "Documentation",
                "License": "License"
                }[term]
    except:
        return term


def omfit_to_atom(omfit_sections):
    """ Change OMFIT section naming to AToM section naming."""
    atom_sections = {}
    for section, contents in omfit_sections.iteritems():
        atom_sections[omfit_section_to_atom(section)] = omfit_sections[section]
    return atom_sections


def chart_to_atom(chart_sections):
    """ Change AToM Component chart section names into AToM section naming"""
    atom_sections = get_section_defaults()
    for section, contents in chart_sections.iteritems():
        atom_sections[chart_section_to_atom(section)] = chart_sections[section]
    return atom_sections


def get_omfit_help_paths(omfit_root):
    """ Find OMFIT help files.  Not currently used."""
    omfit_root += "/modules/"
    normalized_path = os.path.abspath(omfit_root)
    command = "find {} -name help.rst".format(normalized_path)
    files = subprocess.check_output(command, shell=True)
    file_list = files.split('\n')
    file_list = [item.strip() for item in file_list]
    for file_name in file_list:
        path_parts = file_name.split('/')
        if len(path_parts) > 1:
            module_name = path_parts[-2]
            print module_name


def parse_help_file(file_name):
    """ Parse an omfit help file.  TODO: Parse this in a more elegant way...
    This should really only take 10 lines or so."""
    with open(file_name) as f:
        content = f.readlines()
    content = [line.strip() for line in content]
    help_sections = {}
    previous_section_name = None

    # Get the starting and ending lines of each section
    for index, line in enumerate(content):
        # Look for headers.
        header = re.findall(r'^[-=]{3}[-=]+$', line)
        if len(header) > 0 and index > 0: 
            
            section_name = content[index-1]
            help_sections[section_name] = {}
            help_sections[section_name]['start_line'] = index + 1
            
            if previous_section_name is not None:
                help_sections[previous_section_name]['end_line'] = index - 2
            previous_section_name = section_name

    help_sections[previous_section_name]['end_line'] = len(content)-1

    # Fill the section content in with the extracted information
    content_sections = {}
    for key, value in help_sections.iteritems():
        content_sections[key] = '\n'.join(content[value['start_line']: value['end_line']+1])

    return content_sections


def parse_atom_help_file(file_name):
    """ TODO: Parse an existing AToM doc for updating"""
    pass


def make_atom_doc(atom_sections):
    """ Take a dictionary of document sections and build a .rst formatted string out of it"""
    in_order_sections = ['Type', 'Contacts(s)', 'Keywords', 'Description', 'Install', 'Documentation', 'Workflows',
                         'OMFIT Integration', 'IPS Integration', 'Performance', 'Imports From', 'Exports To',
                         'Publications']

    doc = atom_sections['Component'] + "\n"
    doc += "="*len(atom_sections['Component']) + "\n"
    doc += atom_sections['Short Description']
    for section in in_order_sections:
        # Comment out the section if it would be blank.  This way someone can fill it in manually if they edit the file.
        # But it won't add any clutter.
        comment = ""
        try:
            if len(atom_sections[section].strip()) == 0:
                comment = ".. "
        except:
            comment = ".. "
        doc += "\n" + comment + section + "\n"
        doc += comment + "-"*len(section) + "\n\n"

        if section in atom_sections:
            doc += atom_sections[section]
    return doc


def parse_component_table(table_file_name):
    """ Parse the components table constructed on the AToM wiki
        To generate AToM component documentation templates"""
    with open(table_file_name) as f:
        content = f.readlines()
    content = [line.strip() for line in content]
    header_line_number = -1
    for index, line in enumerate(content):
        divider = re.findall(r'^[|][-]+', line)
        if len(divider) > 0 and index > 0:
            header_line_number = index-1
            break

    components = []
    if header_line_number >= 0:
        header_titles = content[header_line_number].split('|')[1:-1]
        header_titles = [field.strip() for field in header_titles]
        for line in content[header_line_number+2:]:
            fields = [field.strip() for field in line.split('|')[1:-1]]
            if len(fields) == len(header_titles):
                component = dict(zip(header_titles, fields))
                atom_component = chart_to_atom(component)
                components.append(atom_component)
            else:
                # We only want the first table, so stop parsing when
                # We are no longer in that table.
                break
    return components


def docs_from_table(component_table_file_name, mode="replace"):
    """ Make documentation from the github AToM component table"""
    components = parse_component_table(component_table_file_name)
    # For each component, get OMFIT dictionary if it exists
    for component in components:
        comp_name = component['Component'].strip().replace(' ', '_')
        omfit_file_path = omfit_root + "/modules/" + comp_name + "/help.rst"
        path_has_file = os.path.isfile(omfit_file_path)
        atom_omfit_sections = get_section_defaults()
        if path_has_file:
            help_sections = parse_help_file(omfit_file_path)
            atom_omfit_sections.update(omfit_to_atom(help_sections))

        # Merge OMFIT & component dictionaries on a field to field basis.
        # .update() won't work here since we need to combine the fields.
        # keys_to_merge =
        for key in component.keys():
            try:
                if key != 'Component':
                    if len(component[key].strip()) > 0:
                        component[key] = "\n.. From AToM Component Chart .. \n\n{} \n\n.. End From AToM Component Chart ..\n".format(component[key].strip())
                    if len(atom_omfit_sections[key].strip()) > 0:
                        component[key] += "\n.. From OMFIT Docs .. \n\n{} \n\n.. End From OMFIT Docs ..\n".format(atom_omfit_sections[key].strip())
            except:
                pass
        component_doc = make_atom_doc(component)
        with open(output_path + comp_name+".rst","w") as output_file:
            output_file.write(component_doc)


def generate_index(component_help_path):
    pass


def main(argv):
    print argv

    component_table_file_name = atom_wiki_root + "/AToM-Component-Chart.md"
    docs_from_table(component_table_file_name)


if __name__ == "__main__":
    main(sys.argv[1:])
