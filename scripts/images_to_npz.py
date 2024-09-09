import os
import numpy as np
from PIL import Image


def process_images_to_npz(image_dir, output_file, target_size=(256, 256), max_images=300):
    images = []
    image_filenames = os.listdir(image_dir)

    # Sort filenames and limit to `max_images`
    image_filenames = sorted(image_filenames)[:max_images]

    for img_name in image_filenames:
        print(f"Processing image: {img_name}")
        img_path = os.path.join(image_dir, img_name)

        # Open the image and convert to RGB (to ensure it's 3 channels)
        img = Image.open(img_path).convert('RGB')

        # Resize the image to the target size
        img_resized = img.resize(target_size)

        # Convert the image to a numpy array and append to the list
        img_array = np.array(img_resized)
        images.append(img_array)

    # Convert the list of images to a numpy array
    images_np = np.stack(images, axis=0)

    # Save the numpy array to an NPZ file
    np.savez(output_file, generated=images_np)
    print(f"Done, saved output of shape: {images_np.shape}")

# Example usage
image_directory = '/opt/cosign/datasets/lsun_val'
output_npz_file = '/opt/cosign/datasets/lsun_val/val_300x256x256x3.npz'
process_images_to_npz(image_directory, output_npz_file)
