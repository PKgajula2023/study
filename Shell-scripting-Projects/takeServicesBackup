sourcePath='/apps/apache-tomcat-8.5.0/webapps'
backupParentPath="/apps/content/prod-wars-backup"
configPath="/apps/appconfig"
Date=`date +%d%b%Y-%H`
backupPath="$backupParentPath/$Date/services"
echo "creating backup directory"
mkdir -p $backupPath
echo "backing up current version to $backupPath/"
cp $sourcePath/*.war $backupPath/
cp -R $configPath/config.properties $configPath/aditya-birla-pdf $configPath/templates $configPath/orchestration $configPath/services_templates $configPath/partner_templates $configPath/soap_templates $backupPath/
echo $backupPath