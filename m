Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE1A37A4A5
	for <dtrace@lists.linux.dev>; Wed,  7 Jan 2026 16:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803353; cv=fail; b=uSaAs2nUchjLuM2+pgnOfZ3sz+wwzkrBoEUrFP+LQZWlDceGImhWPYtmlMpwgLP6hcxwEkNByTlwis+tgxx+BVztt76nD5rJQBAieKztZUBrCoWy7Yc4fzKToMk2ZSKacmtVysfwNgfWUCtzxgzSu4BVJ1Ep1jxTvDxvmVbNb10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803353; c=relaxed/simple;
	bh=C0qOoTV4b0fitrjf1idAgYPixIFUezba2nTl1ctiEfg=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=OuEQbHmUo1zLXSnJwYbP/UePMCmqiMtoC2yG7qWcowy8OZHNbwYIhsof3v8dJT2Y07lnYXgtndpXLE3q0g/tq4lx4PC3A1hQGcB7CSWiSkmyFncK2h4U6/9ORtUcvo9rrbhdzoQdXQZr9Dm11SrX2yqTaqDaO/u5+KCrpfq3Yn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Shtjhs9I; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oLxRBBGg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Shtjhs9I";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oLxRBBGg"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607EPSrM2138509
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 16:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=F3XPAhHN1lrWfTYRzyeH4gUe9HYql/eGvJ8hzFgwiBg=; b=
	Shtjhs9IfmSMH2QyvElA9f5fVD5c0K4KXjND3QH5A1FWYgG/ssofgJ04j7WwAiPz
	uSVnWRt07HWqrEpmirEaZcSLVVKxezMQa6V2Dnp5IUvvuC3UMRSdQBZL3wQPFQx1
	rUI88W1lcH7qYsEhGe8CKMYFLqw9wHhuv7O0KHMORD2ve24upyubo14so1rx6szc
	QhZ6ra+CH+OsSGJcCDhA2t6WnfUNKamJRbzKygpjhGMEYpOndh4SOn66+cYFdHvh
	uRqAzoYBRF5jI20AExXITZ5Uvo4oKtDE1F3i/uSkVExqLfQ3S7n8webZmN9yzSea
	oDarjtonG5bJnSZvz8Daow==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bhs8586v7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 16:28:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 607FUrj7016243
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 16:28:53 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012015.outbound.protection.outlook.com [40.107.200.15])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besj9strg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 16:28:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndIkA2Tehb8e3OHtBHMMa1LL5fMpaCfeGkzzQzP7rWLKP+iffahkhlQ4AcJLEhQFiJHsJme9XrjPWnzT27p28UED4IR1/kPz/53K4t60pbUUIVpsst/Rl+XAZUrhsAtzhZT9mmGHqZ6rZefzJMHv9qI10PccTYL0jZoYwSL0vZDYRHzTzLzJFiF5TEyFjTlhVtw+DbqXlPGdaOGoM6gKvu8GLv7ELexfYBXKy6hcRpt4chNgW69WGcp70tur9bXcKTDkdS/VRedd+Spy6sl0ZI3IYFkcQw130N7ya4AuHKPBw6vtqNkh3C3d5VGgx0L8ZYjSXyrngYuj0NIc8fC8Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3XPAhHN1lrWfTYRzyeH4gUe9HYql/eGvJ8hzFgwiBg=;
 b=NWFIa5U3thQqtRiUmBJyhn8dYgnSQy1PZOIuCRJdPE6QoepFmrLtA/VThFi1HxSaaSgW+dIxH2FsilmCpxMjMnuLQ4Lt9vwBxmwCRuT8ECnfyvcn7wFHLMpmR/BFxSkeaIU+Z54Z8X33mi2QRnmq84hmBXA5wMns806t3fP3eM1Bumu51UIY7kk5hAhV73iG+ZyS3GOm1JZP8aAqTxwGHPWHfGU8T/TVmI8dfhYWZcCqbRIqJrMue3ejqXvAUTWgxAbmtkFbHrnE8Lcd2y514J7YooY9tyaCORtZRPfsRzwc9YvLIeDu6NumyEIn/zfexbscAjqh9XIy35GW+/ZpVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3XPAhHN1lrWfTYRzyeH4gUe9HYql/eGvJ8hzFgwiBg=;
 b=oLxRBBGg4+sS9grFmUx/IB0cETzU/25lYGYHUyWHmPNrNMyKkK1nyxd9uo4PSxtS/wNPZqPz7WtQWdgEYSRQiq/iaW1k2Nju1jEMsrso/TiT/3jZE13oCxrecWi2TpC+I3UUwjR/doZyOs3vSHqLycXEcSPWVGM1tAUlVsE1smk=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by MN0PR10MB5960.namprd10.prod.outlook.com (2603:10b6:208:3cc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 16:28:48 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 16:28:48 +0000
Date: Wed, 07 Jan 2026 11:28:47 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 2/4] test: correct file permissions
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB752234D6A8CA009C7E01E158C284A@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|MN0PR10MB5960:EE_
X-MS-Office365-Filtering-Correlation-Id: fdade07c-74b2-4582-bc36-08de4e09d5d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sbWkd54A4VVEcovn5pMxlTO3thLdraUBl1+/R3X6giOmKqykMXe/Xzj8zoFd?=
 =?us-ascii?Q?xcHkRrWXD0VSOH6k0KMVYBhsLk2ZVCG0PpxPn4PfayDWO9TooKClPVC0LqOG?=
 =?us-ascii?Q?0LwDXRSIPB6xQZOivTo90j3p2RK5NSc1pcCpUyEPN4nCZidz/EUqtIx4/iAo?=
 =?us-ascii?Q?gcFXFMzduGQKSBm67FPqN0UCyjOQLqZoLq1AxD7T+zlVuLjWaeZ3L2WYs1Bu?=
 =?us-ascii?Q?gHFSgOK9LajtKiZd+OIyixqjwfpYmXcoXxSkLJryO5c1jTfB49MbZG4zhxlN?=
 =?us-ascii?Q?JUEhF+jiVvnJ17bBYjrQ+lHZIeihyQfj2b+T2AO4mXwJJF+VtL4f1Rc5ltPx?=
 =?us-ascii?Q?ncZ3nzOiJtA1jGYXMnKbbSJ8/tLk/qaGLFkgBXdB6HgPLZx1FLmGlZdcU+E6?=
 =?us-ascii?Q?v77OewjuvQnVAAkgWA2J9JKhbFWZ4w9dVVGq9AaxlnfrgUncs39UiG8GzlDJ?=
 =?us-ascii?Q?ugkkHBygAfiH5rGyPRHPgdImSyk1O7q2CSN+mQnHqNycuq/+X0Ot/Igzxk39?=
 =?us-ascii?Q?Ff0mdWO3PNLPoeTm010PjAZ2zaL8mRizv9/89z7DnCA7FutPcd1b1fsjqmgD?=
 =?us-ascii?Q?UtbD2gloU8HNQapV2RQYDOXbFg1e85e6Wil0PTGOMGyGWD2SHxUEgEg6UDeJ?=
 =?us-ascii?Q?CSguDuXuJF/mvaNmkk5VMpUkEpN5Y/MlZr6/4mzzM8nqJgzF0NzyRM8vjOqp?=
 =?us-ascii?Q?3PRINjHnDYQH657kBLtfPueynDt7yAf7I1LdBV0WOofRskOclZWzVgnIaDhO?=
 =?us-ascii?Q?nZEl8LzXXm2mC4DWy6SHmPpCKc0RsnCzEgJwpAs68iYKmvqv1YqcAhkoCXHv?=
 =?us-ascii?Q?BmO9Dr9QZMI5anBF2r9dccw/Z860obxzWImOREcrTxhFuC70t8syHkvp5Yyf?=
 =?us-ascii?Q?18tcxUK69RRHp7GNMV+ejTmcnVMvCWONT8juPZEyGG/VBtyVe0Mf1BhjcAk6?=
 =?us-ascii?Q?p74pHoCGNkarAkeJgP5Inhkl14JxjNMAR7Ck3W+yR9Je+/GY91LDd3HD3XO8?=
 =?us-ascii?Q?JTdtwuJ4IoewBABF9BYwVqMMtkBtJM8gbytXnY6Fu0QeCzNNMpAhcKxPud2t?=
 =?us-ascii?Q?BYcK23mFO9u8MyXWW4LGacEeH9aNrBqHTbJK8Sh/z6/kQzUnsY0T82U/KG+3?=
 =?us-ascii?Q?wgM2HuBo7WheoYA6j8YVHfjr4tFeZC7ON7BXYpEFci24lCnR+Te1mRstwhGr?=
 =?us-ascii?Q?3SOw0A6Ovw52wGasKb64sU67fcm9tJYaAAccvNZ2/TZz5L0RArZADNc+OtQ+?=
 =?us-ascii?Q?CBnXfSEDKYs97rS1YcSxL+IQUwLp4iibeMSvl2bOWz4lDhrRwOfvcWvoa7e6?=
 =?us-ascii?Q?xbw0X+1GMmdac2dpczvnbJH59N1o3zhzjoXbUjN9d/anijb1qvd8mXierV75?=
 =?us-ascii?Q?aHI8iWK0X025orU/hZIVIT0nBfwgnprx9eVyN3WwoVkVBNYDsE5r8tqEgywx?=
 =?us-ascii?Q?XYXUNSx//L8x2IDxpRyw254+RMbIowy6EKQK2QNdk7LFxwHJ0joI3g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qmnn1CZZT2855ZX84g+7Ndo1Z6lNBCsq0QfYtde5BBBmhCrFWloiZEXFKq92?=
 =?us-ascii?Q?3K5L2XZUEZNgRp6cD7TgEzheMoPWMd71R8t1Yof1QHfcg+O4GvYhpHc8vHhb?=
 =?us-ascii?Q?YWITgkTKsFoL8bevQY6oExeJMyrFw3G01bbw+Z2CoKuFyfuIAQ9zCbv7Cbkt?=
 =?us-ascii?Q?FoNnbLbcunDmAU0XI8TSNjt3PulS4WbULuhx05FSLMQ3+VxD6FfX79FZnaEh?=
 =?us-ascii?Q?esZliFu23cvSTTdADRvfYf23PD8nEHCBl+cp4Ueg9erMypbE4SyAoGoiPDLp?=
 =?us-ascii?Q?Xm1sJgRJz2NrX3M2ZeQ6iUChtW1Ib9RwTpGoIij3wMBJCFIU4NSvlDarwN/h?=
 =?us-ascii?Q?HNU9tosU9aYGXtyQtHF8wWDlW6BMxTKlJqqU3iz8wAtV+JaFavJcUE2O9qm9?=
 =?us-ascii?Q?IJ72kmZcdX9jO6tV4kq45ukVVjVareQYfieumUgxO9jgakG3fFv3klEonUOy?=
 =?us-ascii?Q?YfR8ijBgB5x6gZvsAhd2TjkUbVFm3ngeWhgb5nXYqSCmCO6RzA0exS/tpUy5?=
 =?us-ascii?Q?csEOYjGFgfQRWsTBOSrD4MeJ1on93sWrt+DW8BknWH3yslE1fGdkXjS8Kvnt?=
 =?us-ascii?Q?NxJum2INLNUElD4SIftUbNJysXmLCsCCAIfzY4AV/oo8dIyiqXCJfq5dIYsc?=
 =?us-ascii?Q?0b2uW6RYRQdiT7WkA8edaao9FfMBUW1ta8TH7pXxRc9YvF+AF1Eqy2FpRlZR?=
 =?us-ascii?Q?edeFx48fTQsWUXahwmhUIXCyeH5/Ow5RqYlSKmRS5FPMzb5Z4Q8X6yNxfFvz?=
 =?us-ascii?Q?Lsy+hNXp5aNo4cdTnHPp5B20dy/TEcvkzXI35zw3U86V2LpNMu3amxgdYa3o?=
 =?us-ascii?Q?NBtQ7UtLX+iRNe7En8F/so0UoQYBxKmkQju1g3SQ4OUNZi/oJpF1NMb0LIsp?=
 =?us-ascii?Q?BOvPl59YEWy0IIhgYMlj4yM7bxCSQ+MDB8HUbWgzuXnbCqUyG3Ce63jXVsaD?=
 =?us-ascii?Q?2UmNUKMA3tE04Md/TVd4JsHTTijxk4Hp9CnjDsQ8YLG+cnA9CDhoKYBx4sTX?=
 =?us-ascii?Q?XaG9JuwCZyd8dyRM4DvrT1HuZS9iUPQXpU8uyo6qdw4rXlWdei2a4m04snnX?=
 =?us-ascii?Q?BQDE4Ow653mCRRiElypyKPc1rcWIvK6AZnOMQZja9j/bDSRMxm7YtKshyWiQ?=
 =?us-ascii?Q?yh8NZuJjGtK+a8dbpkYZ0uR89JQFuUj0RRqjgJKpHmsFol06e04xr5wV4zdJ?=
 =?us-ascii?Q?TGNeZubgmmkZMRloj4lmhsijinWrFwx187dRGqhtok1X5F/nJaSXmaQ+HJN4?=
 =?us-ascii?Q?ewq968bOuZ2kMyAk7MvBYbGBd+L5MmLUFqwR5mlj23vTLRvyCi9lGtnwGPPE?=
 =?us-ascii?Q?S6Fu9qVG4G1WfK/Mlibbaq4LUiur0Gl0sEQM/C3+i7C9RNsHYrmm5CTzZGxF?=
 =?us-ascii?Q?XJskEYPAgxF+/pFjs3oTD9N6qf4AlVZwF9ayzLJfMgFmWcuYFWXJGx7fRh/v?=
 =?us-ascii?Q?ki3qjsVuChcZC063zSA7/cllbalCG3ghQ1PNv9lOqz+TwJCQOsSfuq1jaH+l?=
 =?us-ascii?Q?GAmu+vFmN2uSquHVpRZjPUpLTtb0KzQWiR25uhkDyse1oeWnYZ75/kRtleHO?=
 =?us-ascii?Q?TYC1AgqaugDGfplRBYgy+m5Nc/GXE10bn4OyvBEvQ2a9MGeRbswj1burE0b0?=
 =?us-ascii?Q?0glbZsCqqmis62HYyr7YReH+2z0fEWyFd9R3HZRvqKld2Q55n9MDVThlZ3fp?=
 =?us-ascii?Q?DGFvwQ8MyJXNPmNdZeSuNyeIqA5qqFQx8W+kRXgF7bILXuxBZEa01hcUtiTf?=
 =?us-ascii?Q?/jCzc3c38g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vyM5ywyd1EECBOZRWpmiNSErrCcwKwcQ8wi/qS3CFi9AYzLQrwUibiEbNiiVhWMGHgYGGrRij9UAY3AluAYpV7phO2sSriA2Y72CgrV6ZKqIhCHcvryMKU1F1y8B78KsfZWMsWa8qDZBEFK2j4N5E0aGrVR7e1mGdfS7yd3Wx8Gpo65/29sELIa623hWF+ObVhg38H5eZ5iCWzJpJcek/gALhr+Rmaxy6J4EcGrShWXNXPUxN+YsGPSzbMDnXFt/7fzXTBlywdIIH4odcRb254BkMLZxcRWoN2etLziUvzPGiXC5WkvFfsNtzMLI5sC8+yjwwhE3JP+w399P6TcksCIQvnvGauBngT1ot9ft2D9eZXBmiE2c2R2kBb4mojAcrJc91on+ijmDXOGpzvDbgdttb3dP+PO2YsTp37n3hrCcOBfN7E5AZUXeFiiWInut9XYn+2SFIehz22zvNpF3O1syPrPlbkGywM0Rusxnc8H01dGJJFFMHyuisX+M9vOviHks6kd9MSTWhVt6m/0Y3j+q1dBB6O58gFPe/a7ICH/fWUFMhw9NwPmYk4ZNnhs7XWOhdNldtYweMnUczyFtk2w47SXuTS4YAtigRe0wu7E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdade07c-74b2-4582-bc36-08de4e09d5d2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 16:28:48.4461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7uw3pI8AL6KB07UehKgBnWj52UTZxL46S7aSRGHxSGDH6chlns/DBDhwSdXHSMptkqZo3zT6koA7Dpwxb2v6EkNnpXsfp38QwZ8/c+CFAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5960
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601070129
X-Proofpoint-GUID: 3vT-unPwop8fx3b__bPsVZLSiv8WN9fq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEyOSBTYWx0ZWRfX2KgPcfeWxUX5
 ujPHw1DbZLrl1Hicb04APPurgET++qVFp7znZ1cPbEe+Qtyh0vN7vfSHzXqdv5NRwloZTh3qjE5
 zZs21ZkitjsCJoeoVYZeDipdgXbyx9W9rk0TL8wFhJR430aDhgB+jbaJ1xb5b1l8btSKOYUpFul
 pzavwBxG4Xf7kNiJazPD2XBl5pGAtmMOIe4fuuLiEz4jgs6f9qBsdsXoLqNalfJzUDb3HJeeWHf
 UF8qaDdRgouGjfbUZzy7FsclL80PTksfKDNIDQMyC5fYmb51riSPrGYyQMO6ivEl5ZyZZLlC+As
 IWZLA0qIVsQ/o0rFZrr34keciXrv0UNjCby/qbxjv17u9sDmzat0o4EDfufiVnkqxNvqI6pgcw1
 hulTutmijjhqwlvmJ86AGFiwLQ9Hex5ntasnp7P8iFc+OasBWKcB61x/eMtwVLRxMEsn6b1rL8r
 2v224Vl2iGLaavG495A==
X-Authority-Analysis: v=2.4 cv=Uuhu9uwB c=1 sm=1 tr=0 ts=695e89c6 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=PXnydMbqEvA_UyG8nTAA:9 a=XaXBPwxfFXEC9MZq:21
X-Proofpoint-ORIG-GUID: 3vT-unPwop8fx3b__bPsVZLSiv8WN9fq

Various tests had a #!-invocation while still being expected to be used
as scripts fed to dtrace.  Removed the #!-lines and marked the files
non-executable.

Various tests that were meant to be invoked as standaline scripts had an
absoolute path to dtrace in the #!-invocation which was not recognized.
runtest.sh expects standalone D scripts to use '#!dtrace' so that the
correct path to the dtrace executable being tested can be inserted.
Corrected the tests, and ensured they are executable.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/demo/script/interp.d                                   | 4 ++--
 test/demo/script/tracewrite.d                               | 6 +++---
 test/demo/spec/specopen.d                                   | 6 +++---
 test/stress/fbtsafety/tst.vahole.d                          | 4 ++--
 test/unittest/lockstat/tst.lockstat-summary.d               | 0
 test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d     | 4 ++--
 test/unittest/scripting/err.D_OP_LVAL.rdonly.d              | 4 ++--
 test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d        | 4 ++--
 test/unittest/scripting/err.D_SYNTAX.concat.d               | 4 ++--
 test/unittest/scripting/err.D_SYNTAX.desc.d                 | 4 ++--
 test/unittest/scripting/err.D_SYNTAX.inval.d                | 4 ++--
 test/unittest/scripting/err.D_SYNTAX.pid.d                  | 4 ++--
 test/unittest/scripting/tst.arg0.d                          | 4 ++--
 test/unittest/scripting/tst.assign.d                        | 4 ++--
 test/unittest/scripting/tst.basic.d                         | 4 ++--
 test/unittest/scripting/tst.pgid.d                          | 4 ++--
 test/unittest/scripting/tst.pid.d                           | 4 ++--
 test/unittest/scripting/tst.quiet.d                         | 0
 test/unittest/scripting/tst.sid.d                           | 4 ++--
 test/unittest/scripting/tst.trace.d                         | 4 ++--
 .../speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d    | 5 ++---
 .../speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r    | 2 +-
 .../speculation/err.D_ACT_SPEC.SpeculateWithChill.d         | 5 ++---
 .../speculation/err.D_ACT_SPEC.SpeculateWithChill.r         | 2 +-
 .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d       | 5 ++---
 .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r       | 2 +-
 .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d    | 5 ++---
 .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r    | 2 +-
 .../speculation/err.D_ACT_SPEC.SpeculateWithPanic.d         | 5 ++---
 .../speculation/err.D_ACT_SPEC.SpeculateWithPanic.r         | 2 +-
 .../speculation/err.D_ACT_SPEC.SpeculateWithRaise.d         | 5 ++---
 .../speculation/err.D_ACT_SPEC.SpeculateWithRaise.r         | 2 +-
 .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d | 5 ++---
 .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r | 2 +-
 34 files changed, 59 insertions(+), 66 deletions(-)
 mode change 100644 => 100755 test/demo/script/interp.d
 mode change 100644 => 100755 test/demo/script/tracewrite.d
 mode change 100644 => 100755 test/stress/fbtsafety/tst.vahole.d
 mode change 100755 => 100644 test/unittest/lockstat/tst.lockstat-summary.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_OP_LVAL.rdonly.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.concat.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.desc.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.inval.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.pid.d
 mode change 100644 => 100755 test/unittest/scripting/tst.arg0.d
 mode change 100644 => 100755 test/unittest/scripting/tst.assign.d
 mode change 100644 => 100755 test/unittest/scripting/tst.basic.d
 mode change 100644 => 100755 test/unittest/scripting/tst.pgid.d
 mode change 100644 => 100755 test/unittest/scripting/tst.pid.d
 mode change 100644 => 100755 test/unittest/scripting/tst.quiet.d
 mode change 100644 => 100755 test/unittest/scripting/tst.sid.d
 mode change 100644 => 100755 test/unittest/scripting/tst.trace.d

diff --git a/test/demo/script/interp.d b/test/demo/script/interp.d
old mode 100644
new mode 100755
index be690b56..fba39e41
--- a/test/demo/script/interp.d
+++ b/test/demo/script/interp.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -s
+#!dtrace -s
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2005, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2005, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/demo/script/tracewrite.d b/test/demo/script/tracewrite.d
old mode 100644
new mode 100755
index 0c139ead..f888ecd8
--- a/test/demo/script/tracewrite.d
+++ b/test/demo/script/tracewrite.d
@@ -1,13 +1,13 @@
-#!/usr/sbin/dtrace -s
+#!dtrace -s
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2005, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2005, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
-/* @@trigger: readwholedir */
+/* @@runtest-opts: -c test/triggers/readwholedir */
 
 syscall::write:entry
 /pid == $target/
diff --git a/test/demo/spec/specopen.d b/test/demo/spec/specopen.d
index e7dbc3b2..b3769789 100644
--- a/test/demo/spec/specopen.d
+++ b/test/demo/spec/specopen.d
@@ -1,12 +1,12 @@
-#!/usr/sbin/dtrace -Fs
-
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2005, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2005, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
+#pragma D option flowindent
+
 syscall::openat:entry
 {
 	/*
diff --git a/test/stress/fbtsafety/tst.vahole.d b/test/stress/fbtsafety/tst.vahole.d
old mode 100644
new mode 100755
index b918e663..732ae3ca
--- a/test/stress/fbtsafety/tst.vahole.d
+++ b/test/stress/fbtsafety/tst.vahole.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -Cs
+#!dtrace -Cs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/lockstat/tst.lockstat-summary.d b/test/unittest/lockstat/tst.lockstat-summary.d
old mode 100755
new mode 100644
diff --git a/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d b/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
old mode 100644
new mode 100755
index 45c37efe..6fcb4d54
--- a/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
+++ b/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/err.D_OP_LVAL.rdonly.d b/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
old mode 100644
new mode 100755
index b51e1160..866a7f32
--- a/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
+++ b/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d b/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
old mode 100644
new mode 100755
index a4880cca..9a9d1566
--- a/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
+++ b/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/err.D_SYNTAX.concat.d b/test/unittest/scripting/err.D_SYNTAX.concat.d
old mode 100644
new mode 100755
index 8f7b210f..8d6e5f64
--- a/test/unittest/scripting/err.D_SYNTAX.concat.d
+++ b/test/unittest/scripting/err.D_SYNTAX.concat.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/err.D_SYNTAX.desc.d b/test/unittest/scripting/err.D_SYNTAX.desc.d
old mode 100644
new mode 100755
index 34ae864c..e8ec7851
--- a/test/unittest/scripting/err.D_SYNTAX.desc.d
+++ b/test/unittest/scripting/err.D_SYNTAX.desc.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/err.D_SYNTAX.inval.d b/test/unittest/scripting/err.D_SYNTAX.inval.d
old mode 100644
new mode 100755
index d3338cfd..d2ae68a6
--- a/test/unittest/scripting/err.D_SYNTAX.inval.d
+++ b/test/unittest/scripting/err.D_SYNTAX.inval.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/err.D_SYNTAX.pid.d b/test/unittest/scripting/err.D_SYNTAX.pid.d
old mode 100644
new mode 100755
index 01044d6e..1f383dd7
--- a/test/unittest/scripting/err.D_SYNTAX.pid.d
+++ b/test/unittest/scripting/err.D_SYNTAX.pid.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/tst.arg0.d b/test/unittest/scripting/tst.arg0.d
old mode 100644
new mode 100755
index 905fefb6..d2aa4345
--- a/test/unittest/scripting/tst.arg0.d
+++ b/test/unittest/scripting/tst.arg0.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -s
+#!dtrace -s
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/tst.assign.d b/test/unittest/scripting/tst.assign.d
old mode 100644
new mode 100755
index 9bbd8e49..cde5d64c
--- a/test/unittest/scripting/tst.assign.d
+++ b/test/unittest/scripting/tst.assign.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/tst.basic.d b/test/unittest/scripting/tst.basic.d
old mode 100644
new mode 100755
index cd7b716a..792d6f06
--- a/test/unittest/scripting/tst.basic.d
+++ b/test/unittest/scripting/tst.basic.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -s
+#!dtrace -s
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/tst.pgid.d b/test/unittest/scripting/tst.pgid.d
old mode 100644
new mode 100755
index 8d82f2bd..44ce7515
--- a/test/unittest/scripting/tst.pgid.d
+++ b/test/unittest/scripting/tst.pgid.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/tst.pid.d b/test/unittest/scripting/tst.pid.d
old mode 100644
new mode 100755
index 2d0499d7..70197c86
--- a/test/unittest/scripting/tst.pid.d
+++ b/test/unittest/scripting/tst.pid.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/tst.quiet.d b/test/unittest/scripting/tst.quiet.d
old mode 100644
new mode 100755
diff --git a/test/unittest/scripting/tst.sid.d b/test/unittest/scripting/tst.sid.d
old mode 100644
new mode 100755
index e4f1395c..670761d8
--- a/test/unittest/scripting/tst.sid.d
+++ b/test/unittest/scripting/tst.sid.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -s
+#!dtrace -s
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/tst.trace.d b/test/unittest/scripting/tst.trace.d
old mode 100644
new mode 100755
index 148e5c60..f52b14ef
--- a/test/unittest/scripting/tst.trace.d
+++ b/test/unittest/scripting/tst.trace.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -s
+#!dtrace -s
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
index 50bbf177..044b5a95 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
@@ -1,7 +1,6 @@
-#!/usr/sbin/dtrace -ws
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,8 +9,8 @@
  * ASSERTION: Destructive actions may never be speculative.
  *
  * SECTION: Speculative Tracing/Using a Speculation
- * SECTION: dtrace(1M) Utility/ -w option
  */
+#pragma D option destructive
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
index 1590807c..206641c0 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
+dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
index 47e248d2..e02577d2 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
@@ -1,7 +1,6 @@
-#!/usr/sbin/dtrace -ws
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,8 +9,8 @@
  * ASSERTION: Destructive actions may never be speculative.
  *
  * SECTION: Speculative Tracing/Using a Speculation
- * SECTION: dtrace (1M) Utility/ -w option
  */
+#pragma D option destructive
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
index d01ab558..ab7c6ed9 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
+dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
index 14cc1d5c..dbb8f294 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
@@ -1,7 +1,6 @@
-#!/usr/sbin/dtrace -ws
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,8 +9,8 @@
  * ASSERTION: Destructive actions may never be speculative.
  *
  * SECTION: Speculative Tracing/Using a Speculation
- * SECTION: dtrace(1M) Utility/ -w option
  */
+#pragma D option destructive
 #pragma D option quiet
 
 char a[2];
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
index 89592786..f57aba47 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d: [D_ACT_SPEC] line 34: destructive actions may not follow speculate( )
+dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d: [D_ACT_SPEC] line 33: destructive actions may not follow speculate( )
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
index 43a41440..00f56e1d 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
@@ -1,7 +1,6 @@
-#!/usr/sbin/dtrace -ws
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,8 +9,8 @@
  * ASSERTION: Destructive actions may never be speculative.
  *
  * SECTION: Speculative Tracing/Using a Speculation
- * SECTION: dtrace(1M) Utility/ -w option
  */
+#pragma D option destructive
 #pragma D option quiet
 
 string str;
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
index 3bc21b18..da4038aa 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d: [D_ACT_SPEC] line 34: destructive actions may not follow speculate( )
+dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d: [D_ACT_SPEC] line 33: destructive actions may not follow speculate( )
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
index 80a3204d..9fb6a1e3 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
@@ -1,7 +1,6 @@
-#!/usr/sbin/dtrace -ws
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,8 +9,8 @@
  * ASSERTION: Destructive actions may never be speculative.
  *
  * SECTION: Speculative Tracing/Using a Speculation
- * SECTION: dtrace(1M) Utility/ -w option
  */
+#pragma D option destructive
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
index 3c120a03..7c15314d 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
+dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
index a8c1c4d4..c239bc7a 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
@@ -1,7 +1,6 @@
-#!/usr/sbin/dtrace -ws
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,8 +9,8 @@
  * ASSERTION: Destructive actions may never be speculative.
  *
  * SECTION: Speculative Tracing/Using a Speculation
- * SECTION: dtrace(1M) Utility/ -w option
  */
+#pragma D option destructive
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
index 136f5cde..6e85370a 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
+dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
index a0bca73d..dd20eac4 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
@@ -1,7 +1,6 @@
-#!/usr/sbin/dtrace -ws
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,8 +9,8 @@
  * ASSERTION: Destructive actions may never be speculative.
  *
  * SECTION: Speculative Tracing/Using a Speculation
- * SECTION: dtrace(1M) Utility/ -w option
  */
+#pragma D option destructive
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
index 8cdc6ba1..98725509 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
+dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
-- 
2.51.0

