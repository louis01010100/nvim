export HOMEBREW_GITHUB_API_TOKEN=b7a7347b854f68b4cbeb52d2f09804f1d07020b8
export PATH="/usr/local/bin:$PATH"
export PATH="/Users/louis/Applications/gradle-2.8/bin:$PATH"

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home/"

sshfs -o uid=501,gid=20 rd@ss4.gp.bioinfo:/mnt/of4 /gfs/of4
sshfs -o uid=501,gid=20 rd@ss5.gp.bioinfo:/mnt/of5 /gfs/of5

[[ -s ~/.bashrc ]] && source ~/.bashrc
