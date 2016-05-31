#!/bin/bash

if [ -z "$EMAIL" ] ; then
    echo '$EMAIL is not set'
    exit 1
fi

if [ -z "$ZENDESK_PASS" ] ; then
    echo '$ZENDESK_PASS is not set'
    exit 1
fi

if [ -z "$ZENDESK_URL" ] ; then
    echo '$ZENDESK_URL is not set'
    exit 1
fi

# Build the documentation
tox -e build -- user-guide

if [ $? -ne 0 ] ; then
    echo "tox build failed"
    exit 1
fi

# Clone the publish script
git clone https://github.com/dreamhost/zendesk-publish-script.git

if [ $? -ne 0 ] ; then
    echo "Could not clone the publishing script"
    exit 1
fi

# create a venv to run the publishing script
virtualenv venv ; . venv/bin/activate ; pip install -r zendesk-publish-script/requirements.txt

if [ $? -ne 0 ] ; then
    echo "Failed to make a virtualenv with the proper modules"
    exit 1
fi

# Get all the files that have changed since the last time the script published
# to zendesk
files="`git diff --name-only $GIT_PREVIOUS_SUCCESSFUL_COMMIT $GIT_COMMIT`"
section_ids="`cat .section_ids.txt`"

for file in $files ; do
    if [ -e "$file" ] ; then
        # if the file extension is .rst and it is not "index.rst", get the
        # location it built to and publish it to the section specified in the
        # file "section_id.txt" in the rst file's directory
        if `echo "$file" | egrep '\.rst$' > /dev/null` && ! `echo "$file" | egrep '\/index\.rst$' > /dev/null` ; then
            html_file="`echo $file | sed 's/doc\/\(.*\)\/source\/\(.*\).rst$/publish-docs\/\1\/\2\.html/'`"
            echo "$html_file"
            section_id=""
            if `echo "$section_ids" | grep "$html_file" > /dev/null` ; then
                section_id="`echo "$section_ids" | grep "$html_file" | awk '{print $2}'`"
                echo "$section_id"
            fi
            if [ -n "$section_id" ] ; then
                python zendesk-publish-script/publish.py "$html_file" "$section_id"
                if [ $? -ne 0 ] ; then
                    exit 1
                fi
            fi
        fi
    fi
done

git clone https://github.com/dreamhost/zendesk-pull-article-id
python zendesk-metadata/get_metadata.py
