import pyqrcode
import png
from PIL import image

link = input("Enter anything to generat QR : ")
qr_code = pyqrcode.create(link)
qr_code.png("QR_code.png", scale=5)
Image.open("QRCode.png")