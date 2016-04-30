# plan-with-stories
Work with stories using command line tools and simple visualization.

## Install

    cd $HOME
    git clone https://github.com/gregoryv/plan-with-stories.git
    export PATH=$HOME/plan-with-stories/bin:$PATH


## Usage

Environment variables used by the script in a general way

- EDITOR to edit new stories
- OUTPUT name of output file for e.g. groom and print-story
- BROWSER browser to use when generating printable files

### new-story 

Creates a new story based on the title. If EDITOR is set in your environment
it will be used to open the story for further editing. The story file is
created in the current folder.

Example

    new-story Authentication using password 


### print-story

Creates a html file with the given stories ready to be printed.
If BROWSER is set in your environment it will open the file directly.

Example to render all your stories in current folder

    print-story *.story


### groom

Similar to print-story with the difference that each of the given files
are parsed and included only if meta tag Points has not been set.

Example

    groom *.story


### refile-story

A story file is named by concatenating the mnemonic and the title with some
cleanup. If the title or mnemonic is changed, this script will rename the story file accordingly.

Example to check all stories and rename them if necessary

    refile-story *.story


### filter-story

Story content specific filtering when grep is not enough.

Example to list story files which are not-estimated (used in groom script)

    filter-story "not-estimated" *.story


## Story file format


    FIRST LINE IS THE TITLE

    SECOND BLOCK SEPARATED BY 2 NEW LINES IS
    THE DESCRIPTION.

    + IN-SCOPE LINES START WITH PLUS SIGN
    - OUT-OF-SCOPE LINES START WITH MINUS SIGN

    # FOURTH BLOCK SEPARATED BY 2 NEW LINES IS THE
    # META BLOCK AND EACH LINE MUST START WITH A DASH


### META block

Defined meta tags are

#### # Points:

By default all stories are unestimated and have a list of numbers.
When estimated only a single number should be stated e.g.

    # Points: 3

#### # Tags:

The tags line is a way to have one word indicators for any given story. The
first tag is always the mnemonic and should be uniq among your currently
active stories. Uniqueness over time is not something this project aims to
solve, and frankly I believe it's a non-issue.

Example

    # Tags: hex01 new

