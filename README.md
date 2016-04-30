# plan-with-stories
Work with stories using command line tools and simple visualization.

## Install

    cd $HOME
    git clone https://github.com/gregoryv/plan-with-stories.git
    export PATH=$HOME/plan-with-stories/bin:$PATH


## Usage

### Create a directory within your project PROJECT

    mkdir $PROJECT/plan
    cd $PROJECT/plan


### Create your first story, will be opened with EDITOR if set

    export EDITOR="emacs -nw"
    new-story Nice story title here

Keep adding stories this way and make sure to keep them under version
control.


#### When it's time to start grooming the stories with your team, print them out

    cd $PROJECT/plan
    export BROWSER=firefox
    groom *.story


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

#### Points

By default all stories are unestimated and have a list of numbers.
When estimated only a single number should be stated e.g.

    # Points: 3

#### Tags

The tags line is a way to have one word indicators for any given story. The
first tag is always the mnemonic and should be uniq among your currently
active stories. Uniqueness over time is not something this project aims to
solve, and frankly I believe it's a non-issue.

Example

    # Tags: hex01 new

