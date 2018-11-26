#################### R Set-up script ####################

#### Set working directories - Modify depending on the location of your data 

'''
Linux - data partition. This should be the same for both Linux workstations. Change 'your_username' to yours specifically
We are using the file server below - accessble from Linux workstations
'''
setwd('/home/your_username/brown_lab')  

# Mac home - Change 'your_username' to yours specifically
#setwd('/Users/your_username/Documents/your_folder')

# repo0 = "http://cran.us.r-project.org" # Original R repository if you want to save it as an object 

'''
Short list of more commonly used packages for data wrangling (doBy, dplyr) and plotting graphics (ggthemes etc.) and working with external 
programs (rprime and R.matlab)
''' 
pkg.list = c('ez', 'ggthemes', 'RColorBrewer', 'rprime', 'R.matlab', 'doBy', 'dplyr', 'stringi', 'tidyr') 
doInstall <- TRUE  # Change to FALSE if you don't want packages installed.
toInstall <- pkg.list

# Install the packages we specified above in pkg.list 
if(doInstall){install.packages(toInstall, dependencies=TRUE, repos='http://cran.rstudio.com/')}
lapply(toInstall, library, character.only = TRUE) 

# I install ggplot seperately because it takes 10x longer than anything else. Easier debugging
install.packages('ggplot2', dependencies=TRUE, repos='http://cran.rstudio.com/')
#install.packages('Cairo','http://www.rforge.net/') # optional package for saving hi-res plots while using Windows. Uncomment to use 

# Save workspace
save.image('R-Env-Setup')