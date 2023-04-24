# batch_img_convert

This is a Windows x64 program written in Delphi 11.4 that can batch convert image files of different formats such as BMP, JPG, PNG, GIF, TIFF.

## Features

- You can select single files or folders to convert (also support file(s) drag-drop
	- batch select files to convert
	- **Recursive** feature
- You can recursively convert all image files in the folder
- You can choose the output image format and quality
- You can choose whether to overwrite the original file or save as a new file
- You can view the progress and result of the conversion
```
Convert BMP, JPG, PNG, GIF, TIFF file format  
  to  
BMP, JPG, PNG, GIF, TIFF file format
```

## How to use

- Download and unzip all files in the [Win64/Release](https://github.com/vincentcheng2116/batch_img_convert/tree/main/Win64/Release) folder
- Run the batch_img_convert.exe program
- Click the "Add Files" button and select the image files or folders you want to convert
- Click the "Convert" button and select the output image format and quality
- Click the "Start" button to start converting image files
- Wait for the conversion to complete and check the conversion result

## Example

![help.png](help.png)

## References

- [batch_img_convert](https://github.com/vincentcheng2116/batch_img_convert)
- [Delphi 11.4](https://www.embarcadero.com/products/delphi)


## Code write by delphi 11.4

## Running under Windows x64 system

### markdown related code hint
- In VisualCode add extension :
  - Markdown All in One
  - Markdown+Math
  - markdownlint
  
Once yoe done those installation.
open a markdown file (*.md) by visual studio code
click previewe function on upper-right corner
press CTRL-Shift-P and keyin "markdown" it will list all of fearure you could use.

```
*
#
##
###
[```]
  code block
$ for math feature
add image file:
   ![](file_name.jpg | width=200)
**bold**

```


### markdown math example


```
When $a \ne 0$, there are two solutions to $(ax^2 + bx + c = 0)$ and they are 
$$ x = {-b \pm \sqrt{b^2-4ac} \over 2a} $$
```
When $a \ne 0$, there are two solutions to $(ax^2 + bx + c = 0)$ and they are 
$$ x = {-b \pm \sqrt{b^2-4ac} \over 2a} $$

## License

This project is licensed under the MIT License - see the LICENSE.txt file for details