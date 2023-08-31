# Justfile

# load environment variables
set dotenv-load

# aliases

# list justfile recipes
default:
    just --list

# setup
setup:
    @pip install -r requirements.txt

# quarto stuff
preview:
    @quarto preview index.qmd #--output-dir tmp/

# streamlit stuff
app:
    @streamlit run app.py

# smoke-test
smoke-test:
    black --check .

render:
    @quarto render .

clean:
    @rm -rf _book

upload:
    @az storage azcopy blob upload -c '$web' --account-name notonedrive -s "_book/*" --recursive

open:
    open https://notonedrive.z5.web.core.windows.net/
