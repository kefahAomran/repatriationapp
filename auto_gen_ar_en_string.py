import os
import re

# Specify the directory of your Flutter project
flutter_project_directory = "D:\\repatriationapp_new"

# Regular expressions to match various text elements
text_patterns = [
    re.compile(r'Text\(\s*"([^"]+)"'),  # Matches Text("string")
    re.compile(r'title:\s*Text\(\s*"([^"]+)"'),  # Matches title: Text("string")
    re.compile(r'hintText:\s*"([^"]+)"'),  # Matches hintText: "string"
    re.compile(r'value:\s*"([^"]+)"'),  # Matches value: "string" (e.g., dropdown items)
    re.compile(r'buttonText:\s*"([^"]+)"'),  # Matches buttonText: "string"
]

translations = {
    "ar": {},
    "en": {}
}

# Recursively scan files for UI text elements
for root, _, files in os.walk(flutter_project_directory):
    for file in files:
        if file.endswith(".dart"):
            filepath = os.path.join(root, file)
            with open(filepath, "r", encoding="utf-8") as f:
                content = f.read()
                for pattern in text_patterns:
                    matches = pattern.findall(content)
                    for match in matches:
                        translations["ar"][match] = match  # Arabic (default to original)
                        translations["en"][match] = "TRANSLATE_ME"  # Placeholder for English

# Generate the translation file
with open("translations.dart", "w", encoding="utf-8") as f:
    f.write('import \'package:get/get.dart\';\n\n')
    f.write('class MyTranslation extends Translations {\n')
    f.write('  @override\n')
    f.write('  Map<String, Map<String, String>> get keys => {\n')
    for lang, strings in translations.items():
        f.write(f'        "{lang}": {{\n')
        for key, value in strings.items():
            f.write(f'          "{key}": "{value}",\n')
        f.write('        },\n')
    f.write('      };\n')
    f.write('}\n')

print("Translation file generated: translations.dart")
