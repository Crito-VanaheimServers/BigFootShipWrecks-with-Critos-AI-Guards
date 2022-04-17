class CfgPatches
{
	class BigfootsShipwrecks_Server {
		requiredVersion = 0.1;
		requiredAddons[] = {
            "exile_server"
        };
		units[] = {};
		weapons[] = {};
	};
};

class CfgFunctions 
{
	class BigfootsShipwrecks_Server 
	{
		class main 
		{			
			file="BigfootsShipwrecks_Server\bootstrap";
			class preInit
            {
                preInit = 1;
            };
			class postInit
			{
				postInit = 1;
			};
		};
	};
};
