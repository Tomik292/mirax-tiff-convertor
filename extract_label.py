import os
import sys
import openslide


def get_slide_label(full_mirax_path):
    mirax = openslide.OpenSlide(full_mirax_path)
    label = mirax.associated_images["label"]
    label = label.rotate(180)
    _, image_full_name = os.path.split(full_mirax_path)
    image_name = os.path.splitext(image_full_name)[0]
    label.save(f"{image_name}-label.png")


if __name__ == '__main__':
    mirax_path = sys.argv[1]
    get_slide_label(mirax_path)
