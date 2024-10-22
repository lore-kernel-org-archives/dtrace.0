Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DE717C98
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 18:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729622462; cv=fail; b=fir7/xB6P55v7g+8ciUFMlR08UTKI67GQ+0FrqD1K4oqXHkXaHogu4juSFdLxnir7PCFaDrIiSkSVuE+dDrrJpvp5W+LDNHszVIpaiySuJ7SpU9hs464jjkgYcB5FHCIH9ADjYnbUj5XBlf2iT++Qj6FxLahFUGxagpWb8D+FpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729622462; c=relaxed/simple;
	bh=aimMLN2bhpHYC94jaZfrLeiPJjqQ4KLu67GV5qE73A0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TuHPyeudmDRu6PnaA+ugMMtp/jYj/SpvkweMPGANKuDCz2I1W9/eLUAR75MukIV6SnzEjWHnX6GSF0WITB5OpUyXLSTB1MtTLFG5W0Ig9oE7fCOzjIBMf5nrB8ZhXnwfJ86pbhVvEYs6L3CdgRzLe39sQ50fiZGliJgmzJXEFHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=X/IKkNZ1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=t1g2Hrt3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="X/IKkNZ1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="t1g2Hrt3"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MIBekL019171
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 18:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=O0x/aTeE9EndsjjpXL
	+YA3mXz3FyWJBZuK+gBkQ63qY=; b=X/IKkNZ1WeEM9CNW854G48mbyH0j+27pwj
	VeetuU08k5m7nKdUgWUDuvOxYaLlWk4JZ9TIQVk4aVE6/qSMhkSu87JY2EtsAh71
	G8zkFEFwhpve4UsZFT2bvbbtwmDt+LabsPH4N/TIczYkP3dnNwpM5qejN5fXp3yH
	VpfsGIKCY/ey6jq91kzgFrd/nBzlcBiYSoKRf9WX9v0NpdYao8KpIeWa6Rv+9wFj
	jOa3YTt0UX1+YhAHDeYBVXX/Kp4GDgtk/QVrvT4ax8jw4H9elJjy2w8uE0vJ5bdB
	/JePHe0syBI/equE/BFg+jwoF2/4FY6lOLZEyOcQqvf4iZeM7tiw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55uxdcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 18:40:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49MH78fj022663
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 18:40:53 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42c8evxvpc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 18:40:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgMLGSh2EVVEGSzY3dA3lWxiSHg1l81EJwD1rV0s7enUyvpWPPBv2NGsmumaSLFxOwSbbFMMoUZi/k9cR8gNIGH27nTV1V2WUCUIsu3OgsfhQhPi88ri8b2aygqg1g1usu610l6Q0ZsnH6kNtEfVAdU6rGnokArMwjierGD2mxpNVw+Y6AIc59qK9b3IHrWSEZBc78PS56xqTY9yw1/fqUnhcXo//hs1TpfnBWUE1PAphdjl0U0MRJHIDufmgdsXjHsI+MEkSID/CcGswJYLiBxTinjgtlL/Xm8ULCB1ZSWs2EYL0R9hbACe5TMC6J67x/w34XYtcmOh4YzyMISxvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0x/aTeE9EndsjjpXL+YA3mXz3FyWJBZuK+gBkQ63qY=;
 b=KaxaVP/Gk3hrkJh+GL8y/FoeVfekocUCesAVBtySuAatvCOo8lkoHp6X0Txn0CEZ+m9XwCYe+X9k2Lz8GbGsWRpt7QsU1mbnMWW23qP0ItwCiAKoj6xW9wePfUSA5BzSE3Tn1QgEo06KecVWXJ7noI+wCslLMixcCAxtRRm/HBdQopZfO2uSwHUgm1MkpY6Yl0Tze7DXE0QXScV6FkG2HaQXwgOmC1Hhkaht5IxgK+kHaTbPy9wLeDqydISBNN9VvBu5YL86tr8BgRvvX1tIyGF7dEVSTN1oRZTdfx47/MGZOUUQcNZs5hX9o+qcCn4QekUKvCl2uleVMv+4avWwew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0x/aTeE9EndsjjpXL+YA3mXz3FyWJBZuK+gBkQ63qY=;
 b=t1g2Hrt3hRdMcOWisKBlpUnQlAf02BCn+ykClYinubFrZ6rL2GSM5cNRHhv3PZAeK2Rd6ICj7nWBwIgabEf+zztmBJL5bE3rttm7GgAqAHAXuh+HWdlxt8BfwgRuPqbaOXpBvCPpkNVTZMJIQ6tiSgtFRRp7Q3lMeuF16vuwCu8=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CY8PR10MB7123.namprd10.prod.outlook.com (2603:10b6:930:74::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Tue, 22 Oct
 2024 18:40:50 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 18:40:49 +0000
Date: Tue, 22 Oct 2024 14:40:46 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 5/6] usdt: typed args and arg remapping
Message-ID: <ZxfxrhUANHKZZgqn@oracle.com>
References: <20241018195808.270688-1-nick.alcock@oracle.com>
 <20241018195808.270688-6-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018195808.270688-6-nick.alcock@oracle.com>
X-ClientProxiedBy: BN9PR03CA0534.namprd03.prod.outlook.com
 (2603:10b6:408:131::29) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CY8PR10MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: c2bf221f-c4af-4dcc-2d0e-08dcf2c90caf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QFvw4v7bSJ0Opr9nBGOSsnvn/Gyl42zU0bHKswfMEUQV3m6lQAioNQXV5JzR?=
 =?us-ascii?Q?d1cIa4tQCba0MlCdeyxcM3AX2mnUtwDyQ+LPDiW7lCqv3HM1n/+dooVwG73p?=
 =?us-ascii?Q?TNMZ339M5SkH90x9jxve9dnG3mO+pQzgG2xVefxG0IN/PcDpHxAF1YWcbW+I?=
 =?us-ascii?Q?qmya+oGaQO75Nfg2Uw0SO5Qidn4xr8LbbGQ4orTkRo0GDDB8qTC+nZWFwd6E?=
 =?us-ascii?Q?vZchSaJsgKTlL/9S4obJGBv7CWxM853UFv2zBBHJutBbrAK1lFL4llZYLcFV?=
 =?us-ascii?Q?gxrB6aweJ9ykXVTFGdcXiEiNGgbJEZVfE2jRTUWZkSV5qpNtbQpI20t2flLT?=
 =?us-ascii?Q?pBYYc5JkaYuCnoYtxKOw2L+DJ4QTp69M2cNpsoC4iiPzYraOB0bPMNlK2O8R?=
 =?us-ascii?Q?xS9tqmzIcIFD6rs1+E3uz37Efr6MduGBwoZ9MYuFKuFTZyQOwvmZ2iQmGrCd?=
 =?us-ascii?Q?jdH3IkA3G49IAtsbYPgZSx3dfzZi2LPQ8A+lCaI+waR4W2lpVCe/GvNAz3ga?=
 =?us-ascii?Q?jqFewaYCtN9BXLiQd6+r22HXaZzrhRozY9snRWS5GVwn1q68hmIGJZUAJ5F0?=
 =?us-ascii?Q?f+RFMi3/zinYC2K81ud5WSPvzu6J1MM+R+z0On0aNVG+BcuCo0P66yw9eXvg?=
 =?us-ascii?Q?+H9QIVziUv67Lk3IfFUuu8EkhuvOYeaODl62W5Vjgu2sgY3eSQToTbgl9SHs?=
 =?us-ascii?Q?8xnRewju2IqduSBP4lKj7N6NP8oqLVJRn212PR/hPs1F2mbkSfGgr+52zwXe?=
 =?us-ascii?Q?KrZuA1WPNtgpt/Jg273H46vx/pOLolwzYOoghybWKTQr4WUqbPmjAHGHht/d?=
 =?us-ascii?Q?VppyJRLpYdSp8gL1NclC1/MoYMWct2enmDji1oeFBEm9vRugyy8I8GNmx3Na?=
 =?us-ascii?Q?Azo1p+x33Cx+PdwBQ+/fQ1roc7YZDyhUp0Va5FfR1OCbjXdbCjOZk5fVyE0G?=
 =?us-ascii?Q?cqtsWONmIeejdMH2KBxOQorZaqNR5I1/DPn9v+q9c2rTpGUa5Pw3/tMI6itr?=
 =?us-ascii?Q?hIPdnd36gF3pLYQOkqVYi0r6HamZ6jnyiHlk5nHWWe8ABtOPmgxKlqoAwLqL?=
 =?us-ascii?Q?n3mxq5BLetdUtbBj4oXT5g3dpvlZHeFmuH1IoIUbCKDBxfZhiVUYMZN64Cn+?=
 =?us-ascii?Q?AQugBuhLQ9I/OcToK7+mvXcjzA7e+QHAjSxdyfPye9ccX7yuDTHFsC3tXTv0?=
 =?us-ascii?Q?qcLuq4LWqjOI9LZWbAjVqDwg25THMc1pc67Kydr3sIJTXJ9P7MJY97RBiHY8?=
 =?us-ascii?Q?HPMFRzP/zTizoj5t1Hxege3CIJdL0YJbidp8a7t7uNU9d6CwPYYTvaGlTQuv?=
 =?us-ascii?Q?RK+B3e5ntLNizTpkJoPR6vRi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TzHOCn6MlHZho0ZU60CgXT+DUzovXLOnWCC16KPWzs5960vgQH5tntO5O040?=
 =?us-ascii?Q?bXBQDSxbn4oM3/UMNeOT2ofN5DHzqIteJGckQcZKqMdEm9CNFcGfFowslzDc?=
 =?us-ascii?Q?hn7IUJQthBIQAcQfKru9yL/m55fvDyP/3GyGOQQUw6f1+aDstudqLEuQEpoq?=
 =?us-ascii?Q?RdgF4UdXfXkBE66ur1tcDK4xrELBWudaXjf/C5RsY/gCP2H7nYfvAC4E9/RH?=
 =?us-ascii?Q?5St6Dr51VRDe0U9xadyN741xRBTScLpgXvf/S3M/zlBfNcsoOXAYCiprUW4c?=
 =?us-ascii?Q?8DEwZoaCwBXZj6pyPTLQWP7ym8rwkmDQwdtnevObfZK9CuiAwrItSQ01HqtJ?=
 =?us-ascii?Q?A3/gV8+gWb/igwtqdSgxo/TYGSjfGnOBMkBdMzuJfm4V1WQnHy06Npk/1hSQ?=
 =?us-ascii?Q?j5u9HvScMro9Cp/daeU0wa8/ny9fXJ8Shvc098ZGf2ol/RouysZBkFV+ouDJ?=
 =?us-ascii?Q?zDOg4tyEO6anhus+YNQHMIzHnH7v506tUOQrChN2yy+60RdFFirZZJVaxNl1?=
 =?us-ascii?Q?xkSQOWxLHq1pWS4HzIeaTlV4Yjpjs+Z/D0V57qrVceznMRoRUaEGTUbkjkVg?=
 =?us-ascii?Q?oO6ozxsYpZSTFhkYPa6g8IN2W4ZmqvAKLNfLlJxh29BgIyic72ZmbUab9Cqf?=
 =?us-ascii?Q?9sthWJnxH8kDf0tsE2SSATrOXA8iFi6pdV8zrQX+DIwHsTiJACgN80F5J6Dn?=
 =?us-ascii?Q?lCoUWtBH0wRABNB9XWOB+KAHsmrgkf47qp0Op22bGfb8zVp5FDXrayZ6XWVd?=
 =?us-ascii?Q?Gr3FDBccEOeutoSJpgGDyz4gdZx0krircZrYoSzIYRXz5R2mi0G8xNtTPY8U?=
 =?us-ascii?Q?h+2dPSyzIO7nUsHc2eVkFnwmeP68tZpUvWsmdR+2eOo1TNe6dpB6r3gzwxpN?=
 =?us-ascii?Q?QIyJGPnUDr9pN3Ty07+V/OGPaNVcQ8SYmfndgXbLrDWAPocTFdafK6lom7JL?=
 =?us-ascii?Q?/kQnSjJlEpICs5+0LRb627880bLmCYlgDiNe1zMODea5Me4VljdHRVJwMGPQ?=
 =?us-ascii?Q?Yaz/+i3xjwEJxnCCPt9rbHrBrIvr/V/2I5mrYQxwjVTA9nJ3Q9OjwWXR8baZ?=
 =?us-ascii?Q?enNARtip500aXLDuc9LxwgTFFCJVG2yFtywanrJfOnECC01HGj+0iAwtryeJ?=
 =?us-ascii?Q?0YwijyA/Ou81dYN7LD7YaY6G4AoiEARHmhPvjCTkUxm5+XDUU0OJ+Oig4vNU?=
 =?us-ascii?Q?S9wcpI/NMcVWNF1ikM/6cidQyDJfIjPtbkAPglvQjcNkKxt/XCnN9xwTW3so?=
 =?us-ascii?Q?ddVFejaaFQplohOC9xRE2aAXFCVSBHaVjivt8bmRI0gI4KuipUqpgbCaT/d9?=
 =?us-ascii?Q?6kqE2eY6ktWgNg98TqKqlAaxt4EZ6yUN/wQj8Ww5MpzPnqUKyyoD4aIjt7zt?=
 =?us-ascii?Q?lzBKQsNsasAGEr97hZah90IkUGTGWqB+zRL+7uolkQIjBgUkhUHPoX+RLVcz?=
 =?us-ascii?Q?dg8CkTx9zof3Vme9C+jlhCLDORI2zfN6pW1+Ue4uPur11S5B6jTtJ+OOaEem?=
 =?us-ascii?Q?VoMQJ2js2eFvMpFiTiljjh5PsUqOEATwFm/DBWhWbSxZwFmfeOWo4cMXXqnF?=
 =?us-ascii?Q?F7cZFtmcmsK932GtKo5s6s1ffyLGxyAQrlzCv8uqhzxftFjeCM4nuEtF1yCh?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G1jkrVqc9jLXXgb2gB9KGpqoacOPXn1CfC8NGqKH7sZAIZerTj/6Gth6Ahrk6gZRjV+JQFgitehoz07zm25kJMaAnU+tpwOxeLLAqeU96MGzB3Wpan/ScsiMkyvb3qEebQKIJUGE1CujL3rKZw94fmc2JJW1jExN+dToPlTzoW4TgoRcBClpCKIDprZn6qsRIJTArFGn4fnTi+KheSpICOhDIIYsHU0Au7kMHt3yQkCbQLHMX23OEiJVwlKeHq4/lXu9QT27yPUrwR8kp5ra83Kv0SbDavE2gcbhrFdEIJ8ge+QXR83mX3VYsZOHETbSk/HfgYpvKSEHRmajrTHymLxCemVKnlUNe7BrXxbpcN9V/dSGR+vE+LsCyfZimcWt8rTZlD9ppWIy5jI5T5OsG//uq34mqoexnhjd010vwraZbh79c/wKEct8hBrKJGhGkuPV4akLH53Tbr9hmENgqVTLqVmyYznijBD9ZUoOCd2GjtWn4IKuBfJfRdClk75tzSDS4DT7RSooPYeG1Ta9lg9LuPYEJttdtYXSj2Tkgy94i7QvrAuF0yRIJF2/BEQHl5DmTJs6CL+/p7OH5tlynncbdnrVbt6J+8vMeWRJhhA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2bf221f-c4af-4dcc-2d0e-08dcf2c90caf
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 18:40:49.7091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdGLt/T8HVooYnUyOOUrWyBDu9Qnxn6g6B7hI7vZIi/3Q7ir19opxcPbfdB//dRC6acopInQI12A0TT556veDCp+y1rdoEbIGu2BloAX/uY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7123
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-22_19,2024-10-22_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410220120
X-Proofpoint-GUID: TVEEPSdhxzhq3TNC-OxdXwgExy-rdqd1
X-Proofpoint-ORIG-GUID: TVEEPSdhxzhq3TNC-OxdXwgExy-rdqd1

Standard comments on remapping vs mapping apply :)

On Fri, Oct 18, 2024 at 08:58:07PM +0100, Nick Alcock wrote:
> This change propagates the arg type and mapping info we just got into the
> pid_probespec_t onward into the underlying dt_uprobe_t, shuffles the native
> types before handing off a 1:1 mapping to the dt_probe_t, and calls
> dt_cg_tramp_remap_args() to apply the requested remappings.  With this, USDT
> probes should now have visible types which obey the :-notation translators
> specified in their .d fils (this is now tested).
> 
> The probe info has been moved from the underlying probe to the overlying one
> as part of this: underlying probes don't have any user-visible args to
> get info for, and their probe_info functions are never called.
> 
> We make several assumptions for simplicity, all noted by TODOs in the
> source:
> 
>  - overlying probes all have the same native types and remappings, so we
>    don't need to look at more than one underlying probe to figure out what
>    they are.  Given the structure of DOF it seems to me this must always be
>    true, and even a malicious attacker could not produce DOF which said
>    otherwise.

You cannot place more than one USDT at a particular tracepoint (underlying
probe) so it is guaranteed that all overlying probes can only differ in terms
of their provider name.  The USDT design in DTrace encapsulates the USDT probes
(and providers) as instances of a meta-provider that acts as a template for its
instances.  So, all instances contain the same probes, together with all their
data (arg data, tracepoints, etc).  So, this is a guarantee and need not be
mentioned as an assumption or TODO.

>  - any given underlying probe locus is either a PID or a USDT probe, never
>    both, so we can just remap the args at the start of the trampoline and
>    then never touch them again.  This is obviously wrong, but the both-at
>    the-same-locus case is not yet implemented, and significant changes need
>    to be made to create_underlying() to fix this.  Right now we can't easily
>    even tell if a given locus has both types of probe on it... fixing this
>    is literally a matter of shuffling the pid probes after the usdt probes
>    and then doing a single dt_cg_tramp_restore_args before all the pid
>    probes fire.

I would rewrite this to point out that PID and USDT probes being at the same
locus is not implemented yet, and that this implementation assumes that either
all probes at a particular locus are PID or that they are all USDT.

I would avoid speculative statements about how this might be fixed in the
future (however near that may be) because there may still be design decisions
to be made about that and there is no need to bring it up here.

>    PID args are already broken before this commit (something to do with the
>    wildcard USDT work?) so I cannot test if this commit broke them further,
>    but it shouldn't have.

This does not belong here but rather in a bug report.

In addition, I think it would be good to add a few more test cases to cover
edge cases:

 - A probe that has native arguments, but no translated arguments.
   E.g.
	probe place3(int i, char *j) : ();

 - A probe that has native arguments that do not get used.
   E.g.
	probe place4(int i, char *j) : (char *j);

> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  libdtrace/dt_prov_uprobe.c                    | 163 +++++++++++++++++-
>  test/triggers/usdt-tst-argmap-prov.d          |   3 +-
>  test/triggers/usdt-tst-argmap.c               |   3 +-
>  .../dtrace-util/tst.ListProbesArgsUSDT.r      |  34 ++++
>  .../dtrace-util/tst.ListProbesArgsUSDT.r.p    |   2 +
>  .../dtrace-util/tst.ListProbesArgsUSDT.sh     |  83 +++++++++
>  test/unittest/usdt/tst.argmap-typed.d         |  40 +++++
>  test/unittest/usdt/tst.argmap.d               |   3 +-
>  8 files changed, 320 insertions(+), 11 deletions(-)
>  create mode 100644 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
>  create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
>  create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
>  create mode 100644 test/unittest/usdt/tst.argmap-typed.d
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 481159b01c24..767d9a80b5e1 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -55,7 +55,13 @@ typedef struct dt_uprobe {
>  	uint64_t	off;
>  	int		flags;
>  	tp_probe_t	*tp;
> -	dt_list_t	probes;		/* pid/USDT probes triggered by it */
> +	int		nargc;		   /* number of native args */
> +	int		xargc;		   /* number of xlated args */
> +        int		remapargc;	   /* number of remapped args */
> +	char		*nargv;		   /* array of native args */
> +	char		*xargv;		   /* array of xlated args */
> +	int8_t		*remapargs;	   /* remapped arg indexes */

Since all overlying USDT probes associated with a given underlying probe
(uprobe) have the sane argument type data (native, translated, and mapping),
and PID probes do not have arguments by definition, you can certainly store
the data here.  But why in this raw format rather than a dt_argdesc_t array
(and an argc member to indicate the number of array elements - xargc).

Calls to the probe_info() callback will want an array of dt_argdesc_t elements
to be provided, and nothing else needs the rarw format.  So, you might as well
store that array here rather than the raw data, and implement the probe_info()
callback for USDT as a pass-through that simply takes the data from here (from
the underlying probe), copies it (using strdup on the strings because the
caller will free them), and assigned it to *argv.

For PID probes, there is no probe_info() callback so they will report not
having arguments, and therefore the data being stored at the uprobe level is
still fine.

> +	dt_list_t	probes;		   /* pid/USDT probes triggered by it */
>  } dt_uprobe_t;
>  
>  typedef struct list_probe {
> @@ -112,6 +118,9 @@ static void probe_destroy_underlying(dtrace_hdl_t *dtp, void *datap)
>  	dt_tp_destroy(dtp, tpp);
>  	free_probe_list(dtp, dt_list_next(&upp->probes));
>  	dt_free(dtp, upp->fn);
> +	dt_free(dtp, upp->nargv);
> +	dt_free(dtp, upp->xargv);
> +	dt_free(dtp, upp->remapargs);
>  	dt_free(dtp, upp);
>  }
>  
> @@ -138,7 +147,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	char			prb[DTRACE_NAMELEN];
>  	dtrace_probedesc_t	pd;
>  	dt_probe_t		*uprp;
> -	dt_uprobe_t		*upp;
> +	dt_uprobe_t		*upp = NULL;
>  	int			is_enabled = 0;
>  
>  	/*
> @@ -201,7 +210,48 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  		if (upp->tp == NULL)
>  			goto fail;
>  
> -		uprp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
> +		/*
> +		 * Arg info.  This really relates to the overlying probe (all
> +		 * underlying probes associated with a given underlying probe
> +		 * must have the same args), but the overlying probe doesn't
> +		 * exist at this point so we must put it here and pull it out
> +		 * when the overlying probe info is called for.
> +		 *
> +		 * TODO: is this true? can distinct underlying probes have
> +		 * different native args, as long as their xlated types are the
> +		 * same?
> +		 */
> +
> +                if (psp->pps_nargv) {
> +			upp->nargc = psp->pps_nargc;
> +			upp->nargv = dt_alloc(dtp, psp->pps_nargvlen);
> +			if(upp->nargv == NULL)
> +				goto fail;
> +			memcpy(upp->nargv, psp->pps_nargv, psp->pps_nargvlen);
> +		}
> +
> +                if (psp->pps_xargv) {
> +			upp->xargc = psp->pps_xargc;
> +			upp->xargv = dt_alloc(dtp, psp->pps_xargvlen);
> +			if(upp->xargv == NULL)
> +				goto fail;
> +			memcpy(upp->xargv, psp->pps_xargv, psp->pps_xargvlen);
> +		}
> +
> +                if (psp->pps_remapargs) {
> +			upp->remapargc = psp->pps_remapargc;
> +			upp->remapargs = dt_alloc(dtp, psp->pps_remapargslen);
> +			if(upp->remapargs == NULL)
> +				goto fail;
> +			memcpy(upp->remapargs, psp->pps_remapargs, psp->pps_remapargslen);
> +		}
> +
> +		/*
> +		 * TODO: validate that all underlying probes for a given
> +		 * overlying probe have the same args.
> +		 */
> +
> +                uprp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
>  				      upp);
>  		if (uprp == NULL)
>  			goto fail;
> @@ -413,6 +463,9 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>   *
>   * The trampoline will first populate a dt_dctx_t struct.  It will then emulate
>   * the firing of all dependent pid* probes and their clauses.
> + *
> + * uprobe trampolines will also arrange for argument shuffling if the remapping
> + * array calls for it.
>   */
>  static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  {
> @@ -437,6 +490,34 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  		dt_cg_tramp_copy_args_from_regs(pcb,
>  						!(upp->flags & PP_IS_FUNCALL));
>  
> +	/*
> +	 * Figure out if we need to remap args, and remap them if needed.
> +	 */
> +	if (upp->remapargc) {
> +		int	needs_remapping = 0;
> +		size_t	i;
> +
> +                for (i = 0; i < upp->remapargc; i++) {
> +			if (upp->remapargs[i] != i) {
> +				needs_remapping = 1;
> +				break;
> +			}
> +		}
> +
> +		/*
> +		 * TODO: pid probes are never remapped, so a remapped set of
> +		 * args for UDST probes need saving/restoring to reverse the
> +		 * remapping for pid probes at the same locus -- but right now
> +		 * pid and usdt probes hitting the same locus simply end up as
> +		 * whichever registered first because create_underlying cannot
> +		 * handle this case, so we can avoid it here too.
> +		 * dt_cg_tramp_remap_args already saves regs: all we need to do
> +		 * is restore them before any pid probe is hit.
> +		 */
> +		if (needs_remapping)
> +			dt_cg_tramp_remap_args(pcb, upp->remapargs, upp->remapargc);
> +	}
> +
>  	/*
>  	 * Retrieve the PID of the process that caused the probe to fire.
>  	 */
> @@ -710,8 +791,77 @@ attach_bpf:
>  static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>  		      int *argcp, dt_argdesc_t **argvp)
>  {
> -	*argcp = 0;			/* no known arguments */
> -	*argvp = NULL;
> +	size_t		i;
> +	list_probe_t	*pup = prp->prv_data;
> +	dt_uprobe_t	*upp;
> +	char		*nptr;
> +	char		*xptr;
> +	int		argc = 0;
> +	dt_argdesc_t	*argv = NULL;
> +	char		**nargv = NULL;
> +
> +	/* No underlying probes?  No args.  */
> +        if (!pup)
> +		goto done;
> +
> +	upp = pup->probe->prv_data;
> +	nptr = upp->nargv;
> +	xptr = upp->xargv;
> +
> +        argc = upp->xargc;
> +	if (argc == 0)
> +		argc = upp->nargc;
> +	if (argc == 0)
> +		goto done;
> +	if (!upp->nargv || upp->nargc == 0)
> +		goto done;
> +
> +	/*
> +	 * Construct an array to allow accessing native args by index, if we
> +	 * need to (which we do whenever we have remapped args).  We don't need
> +	 * to worry that any of the indexes might be too large, etc: this has
> +	 * been checked already by validate_provider() before parsing and
> +	 * writing to the DOF stash, and anyone who could inject invalid records
> +	 * into the DOF stash is already root.
> +	 *
> +	 * Shuffle the native args according to the mapping, then set up a 1:1
> +	 * mapping in its place: we do the remapping ourselves, driven directly
> +	 * from upp->remapargs, in the trampoline, so array ops etc should not
> +	 * do it.
> +	 */
> +	if (upp->xargv || upp->remapargs) {
> +		if ((nargv = dt_zalloc(dtp, upp->nargc * sizeof(char *))) == NULL)
> +			return dt_set_errno(dtp, ENOMEM);
> +
> +		for (i = 0; i < upp->nargc; i++, nptr += strlen(nptr) + 1)
> +			nargv[i] = nptr;
> +	}
> +
> +        argv = dt_zalloc(dtp, argc * sizeof(dt_argdesc_t));
> +	if (argv == NULL) {
> +		dt_free(dtp, nargv);
> +		return dt_set_errno(dtp, EDT_NOMEM);
> +	}
> +
> +	for (i = 0; i < argc; i++) {
> +		int remap_arg = i;
> +
> +                if (upp->remapargc > i)
> +			remap_arg = upp->remapargs[i];
> +
> +		if (xptr) {
> +			argv[i].native = strdup(nargv[remap_arg]);
> +			argv[i].xlate = strdup(xptr);
> +		}
> +		argv[i].mapping = i;
> +
> +		/* Guaranteed safe: see libcommon/dof_parser.c:strings_len() */
> +                if (xptr)
> +			xptr += strlen(xptr) + 1;
> +	}
> +done:
> +	*argcp = argc;
> +	*argvp = argv;
>  
>  	return 0;
>  }
> @@ -779,7 +929,6 @@ dt_provimpl_t	dt_uprobe = {
>  	.load_prog	= &dt_bpf_prog_load,
>  	.trampoline	= &trampoline,
>  	.attach		= &attach,
> -	.probe_info	= &probe_info,
>  	.detach		= &detach,
>  	.probe_destroy	= &probe_destroy_underlying,
>  };
> @@ -794,7 +943,6 @@ dt_provimpl_t	dt_uprobe_is_enabled = {
>  	.load_prog	= &dt_bpf_prog_load,
>  	.trampoline	= &trampoline_is_enabled,
>  	.attach		= &attach,
> -	.probe_info	= &probe_info,
>  	.detach		= &detach,
>  	.probe_destroy	= &probe_destroy_underlying,
>  };
> @@ -818,5 +966,6 @@ dt_provimpl_t	dt_usdt = {
>  	.prog_type	= BPF_PROG_TYPE_UNSPEC,
>  	.provide_probe	= &provide_usdt_probe,
>  	.enable		= &enable_usdt,
> +	.probe_info	= &probe_info,
>  	.probe_destroy	= &probe_destroy,
>  };
> diff --git a/test/triggers/usdt-tst-argmap-prov.d b/test/triggers/usdt-tst-argmap-prov.d
> index 28134baa6fa3..7cec525c908a 100644
> --- a/test/triggers/usdt-tst-argmap-prov.d
> +++ b/test/triggers/usdt-tst-argmap-prov.d
> @@ -1,10 +1,11 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  provider test_prov {
>  	probe place(int i, int j) : (int j, int i, int i, int j);
> +	probe place2(int i, char *j) : (char *j, int i, int i, char *j);
>  };
> diff --git a/test/triggers/usdt-tst-argmap.c b/test/triggers/usdt-tst-argmap.c
> index 89a0a53fc1d5..cbdcaf1f0b61 100644
> --- a/test/triggers/usdt-tst-argmap.c
> +++ b/test/triggers/usdt-tst-argmap.c
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -12,6 +12,7 @@ main(int argc, char **argv)
>  {
>  	for (;;) {
>  		DTRACE_PROBE2(test_prov, place, 10, 4);
> +		DTRACE_PROBE(test_prov, place2, 255, "foo");
>  	}
>  
>  	return 0;
> diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
> new file mode 100644
> index 000000000000..8bcfa92ff6b0
> --- /dev/null
> +++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
> @@ -0,0 +1,34 @@
> +   ID   PROVIDER            MODULE                          FUNCTION NAME
> + XX test_provXXXX              test                              main go
> +
> +	Probe Description Attributes
> +		Identifier Names: Private
> +		Data Semantics:   Private
> +		Dependency Class: Unknown
> +
> +	Argument Attributes
> +		Identifier Names: Private
> +		Data Semantics:   Private
> +		Dependency Class: Unknown
> +
> +	Argument Types
> +		args[0]: char *
> +		args[1]: int
> +
> +   ID   PROVIDER            MODULE                          FUNCTION NAME
> + XX test_provXXXX              test                              main go
> +
> +	Probe Description Attributes
> +		Identifier Names: Private
> +		Data Semantics:   Private
> +		Dependency Class: Unknown
> +
> +	Argument Attributes
> +		Identifier Names: Private
> +		Data Semantics:   Private
> +		Dependency Class: Unknown
> +
> +	Argument Types
> +		args[0]: char *
> +		args[1]: int
> +
> diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
> new file mode 100755
> index 000000000000..c575983adf65
> --- /dev/null
> +++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
> @@ -0,0 +1,2 @@
> +#!/bin/sed -rf
> +s,test_prov[0-9]*,test_provXXXX,g; s,^ *[0-9]+, XX,g;
> diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
> new file mode 100755
> index 000000000000..ad8dc2e7c267
> --- /dev/null
> +++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
> @@ -0,0 +1,83 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +##
> +#
> +# ASSERTION:
> +# Testing -lvn option with USDT probes with a valid probe name.
> +#
> +# SECTION: dtrace Utility/-ln Option
> +#
> +##
> +
> +if [ $# != 1 ]; then
> +	echo expected one argument: '<'dtrace-path'>'
> +	exit 2
> +fi
> +
> +dtrace=$1
> +CC=/usr/bin/gcc
> +CFLAGS=
> +
> +DIRNAME="$tmpdir/list-probes-args-usdt.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +cat > prov.d <<EOF
> +provider test_prov {
> +	probe go(int a, char *b) : (char *b, int a);
> +};
> +EOF
> +
> +$dtrace -h -s prov.d
> +if [ $? -ne 0 ]; then
> +	echo "failed to generate header file" >& 2
> +	exit 1
> +fi
> +
> +cat > test.c <<EOF
> +#include <sys/types.h>
> +#include "prov.h"
> +
> +int
> +main(int argc, char **argv)
> +{
> +	TEST_PROV_GO(666, "foo");
> +	sleep(10);
> +}
> +EOF
> +
> +${CC} ${CFLAGS} -c test.c
> +if [ $? -ne 0 ]; then
> +	echo "failed to compile test.c" >& 2
> +	exit 1
> +fi
> +$dtrace -G -s prov.d test.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to create DOF" >& 2
> +	exit 1
> +fi
> +${CC} ${CFLAGS} -o test test.o prov.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to link final executable" >& 2
> +	exit 1
> +fi
> +
> +script()
> +{
> +	$dtrace -c ./test -lvn 'test_prov$target:::go'
> +	./test &
> +	PID=$!
> +	disown %+
> +	$dtrace -p $PID -lvn 'test_prov$target:::go'
> +	kill -9 $PID
> +}
> +
> +script
> +status=$?
> +
> +exit $status
> diff --git a/test/unittest/usdt/tst.argmap-typed.d b/test/unittest/usdt/tst.argmap-typed.d
> new file mode 100644
> index 000000000000..0e0c923e1736
> --- /dev/null
> +++ b/test/unittest/usdt/tst.argmap-typed.d
> @@ -0,0 +1,40 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@trigger: usdt-tst-argmap */
> +/* @@trigger-timing: before */
> +/* @@runtest-opts: $_pid */
> +
> +/*
> + * ASSERTION: Verify that args[N] variables are properly typed when remapped.
> + */
> +
> +BEGIN
> +{
> +	/* Timeout after 5 seconds */
> +	timeout = timestamp + 5000000000;
> +}
> +
> +test_prov$1:::place2
> +/stringof(args[0]) != "foo" || args[1] != 255 || args[2] != 255 || stringof(args[3]) != "foo"/
> +{
> +	printf("args are %s, %d, %d, %s; should be \"foo\", 255, 255, \"foo\"",
> +	    stringof(args[0]), args[1], args[2], stringof(args[3]));
> +	exit(1);
> +}

This test should also test that argN (N = 0 .. 3) has the correct value as
well.  Later we may change that which would require the test to be updated,
but the current immplementation you provide is aimed at ensuring that argN and
args[N] are identical, so you should test that in this case also (because the
other test does not involve different types, which could make a difference).

> +
> +test_prov$1:::place2
> +{
> +	exit(0);
> +}
> +
> +profile:::tick-1
> +/timestamp > timeout/
> +{
> +	trace("test timed out");
> +	exit(1);
> +}
> diff --git a/test/unittest/usdt/tst.argmap.d b/test/unittest/usdt/tst.argmap.d
> index 7896dc07e0e2..9cd3425bf8e0 100644
> --- a/test/unittest/usdt/tst.argmap.d
> +++ b/test/unittest/usdt/tst.argmap.d
> @@ -1,11 +1,10 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
> -/* @@xfail: dtv2 */
>  /* @@trigger: usdt-tst-argmap */
>  /* @@trigger-timing: before */
>  /* @@runtest-opts: $_pid */
> -- 
> 2.46.0.278.g36e3a12567
> 
