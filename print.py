from weasyprint import HTML
import ssl
ssl._create_default_https_context = ssl._create_unverified_context

HTML("resume.html").write_pdf("resume.pdf")

