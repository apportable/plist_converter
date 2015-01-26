# plist_converter
Convert a plist file to binary format in minimum size.

When you packing a plist file into the iOS app bundle, Xcode will help you to convert the plist resources into binary format. In this case the app would get a better performance in terms of loading the plist file. However, in some cases, if you would like to download more plist files at runtime, you might want to convert the plist files to binary format outside Xcode. Your choices are:

### /usr/bin/plutil

This tool can help you convert a plist into different format. However, it would not be a good idea to convert the plist file to binary with this tool, because this tool cannot achieve the minimum size. Of course it would not benefit loadint time that much.

### plist_converter

This tool can simulate the process of Xcode builtin plist converter, which could convert a plist file to a binary file. With the help of this tool, you can generate the same binary format compare to the output of Xcode builtin converter. Therefore, you can achieve the best performance in terms of plist loading.

## Usage

**plistutil -s <src_path> -o <output_path>**
