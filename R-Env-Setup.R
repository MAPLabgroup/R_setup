#################### R Package Set-up script ####################

# Install the Rtools application 
# Download here 
# https://cran.r-project.org/bin/windows/Rtools/


# Require rstudioapi and install if not present 
if (!require(rstudioapi)) {install.packages("rstudioapi"); require(rstudioapi)}
if (!require(installr)) {install.packages("installr"); require(installr)}
if (!require(pkgbuild)) {install.packages("pkgbuild"); require(pkgbuild)}


# Set current dir to script location 
currentWD = dirname(rstudioapi::getActiveDocumentContext()$path)

# Set working directory. use the automated script location method or set manually 
# If manually setting your WD, change below to match OS directory paths 
#setwd('/Users/your_username/Documents/your_folder')  


# if sourcing this script with Source() run setwd() in the parent script 
# after sourcing this one
setwd(currentWD) 


# Checks for Rtools - Stop script run here if you need to install it
# Checks and then opens the Rtools website  


#if(has_rtools() == TRUE) { 
#  browseURL("https://cran.r-project.org/bin/windows/Rtools/"); 
  # installr for rtools is not working as expected. Bug reported here:
  # https://github.com/talgalili/installr/issues/158
  #installr::install.rtools(choose_version = T, GUI = T, 
  #                         page_with_download_url = "https://cran.r-project.org/bin/windows/Rtools/") 
 # print("Download Rtools and install.");
#    print("Start script on the line below where indicated") 
#  }

# For Manual install of  Rtools 40 + use the link below 
#browseURL("https://cran.r-project.org/bin/windows/Rtools/")


################################################################################

###################### START HERE AFTER INSTALLING RTools ######################


# After install this line will write path to system  
#writeLines('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', con = "~/.Renviron")


# Short list of more commonly used packages 
pkg.list = c('caret', 'corrplot', 'devtools', 'dplyr', 'ez', 'ggthemes', 'Hmisc', 
             'lubridate', 'openxlsx', 'pkgbuild', 'psych', 'RColorBrewer', 
             'skimr', 'stringi', 'tidyr') 


#doInstall <- TRUE  # Change to FALSE if you don't want packages installed.
toInstall <- pkg.list

# Install packages from list above 
#if(doInstall){install.packages(toInstall, dependencies=TRUE)}
# 
install.packages(setdiff(toInstall, rownames(installed.packages())))

lapply(toInstall, require, character.only = TRUE)


# I install ggplot separately because it takes 10x longer than anything else. Easier debugging
if(!require(ggplot2)) {install.packages("ggplot2", dependencies=TRUE); 
  require(rstudioapi)}


# Optional -- for windows only 
# install.packages('Cairo','http://www.rforge.net/') # optional package for saving hi-res plots while using Windows. 
# Mac and Linux automatically output and save hi-res graphics in R. 
# Use if you are running R and RStudio from windows. 


# Done 
print("Setup complete. Script resuming.")
