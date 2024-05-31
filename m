Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750E37D40E
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717181992; cv=fail; b=E6UqXX2kDyqeEKsK+JD5SjB3nhRbeUTjqPjH56RUZdRXxwnAvElo9PoXgVcPDA0RMwcmYXZG1Dr+u6EVxRwDzXi8XcC3jDw2c8wDtbIxXOhPSOzu0CbvZ0lCN8NUAI0Gx2mS1l3BQYB/1RKs7A087HADG+Z9ooqF6GYOLwgI5J8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717181992; c=relaxed/simple;
	bh=7lpOFLc75/4YVKA0Q2c3BD7vXfpx3gwZK9TSzrbcyF4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z/fHQ35ciD6H/0cgbZlPDHk6I1QJ5RLtjrw3W04BeHjZXzTyjj7ERZPrdNDWV4HLwGjCJ/bSe4QsI4Nwv3pRlzEtejQwdl+Kj+zOjKyioxHE8MqgXu9OT3OUyvGZxVsuY1YgOaTQNXw4iHXw0Mase6FBFkfinBX/e4HlBWMQ6Bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44VI0Nmh020140
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:49 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-transfer-encoding:content-type:date:from:in-reply-to?=
 =?UTF-8?Q?:message-id:mime-version:references:subject:to;_s=3Dcorp-2023-1?=
 =?UTF-8?Q?1-20;_bh=3D8ppw445+Eap8iBhFZvGNvMUbnLDRThGDCmKZZv+alZQ=3D;_b=3D?=
 =?UTF-8?Q?MQ1lFdY42Lbq8Pt7+DhzcJ2uREc3IYuaQ+n8SlaRzWKamoTEthXEAqjWpWSI3tD?=
 =?UTF-8?Q?4UQQ7_1p/S53bmGpg6aYvr3hC3UK/Y1Jlo7Nn+/3IgpGpywOBwe/50d/98uD7Ly?=
 =?UTF-8?Q?pNiBPi6sAN+_0lNGXDqZdcuG/72OJxf8xv3Xtu72cjQ7VsmpIZIA34fPQ+4c+5D?=
 =?UTF-8?Q?7Yo/bXwVFfv73SoBd_41xC5A/8KU8UrQlsDHZ/AE2dPYVaygcPkZefEp7uUZscP?=
 =?UTF-8?Q?hAezKU8D5NntyHo4YrFM6qD_xex/6KhYVzVupfIPAwGISkmNJb3J3twBav2IgvT?=
 =?UTF-8?Q?H71Fbkap4ZuiQUG9FTTVjWc9GDnUR_4A=3D=3D_?=
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb8kbbvfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:48 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44VHBGua026523
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:48 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3yc50a8758-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXIci2LouentWQ+y4oh9GWh/NgGGZj9cm0Gsk0mUVC8WW9uVugm53nMMsOaKtPkntp8j88rmOQr/XccdJqIjJ0kIn0TDdaxcF1acomaQXnfj2cVo6VOEfqzaoRma0pRE5oBdjN29YalOLbsS7f7USIBDZWjyolCvgGHItQNWLbD6eiE84f0Xq/r/5uOxO3siDPBSdU1fAwgUk6SIU0tdSekBj3Kuf4CUWRUslcEdSyrm/bPmCgc6HxtEEXwLNuj5u9srrvaUok9HcLZT1hzZgqzsD8rj4YpShp6yKzyzK7LVkLene982icSzOpHipR8v2F1XqXoOWxsdr04tPrKITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ppw445+Eap8iBhFZvGNvMUbnLDRThGDCmKZZv+alZQ=;
 b=CaL1pIzKzAQPQ8a7vTdGa0Wu1HK+D1SYwO6Bz42XOCpeG2d6K3Yjyzv+eP7ZLgJ7N4uarzB0wYsG7DJxXqHmKp5SZ6d39TIfTSICwDITmYD1NSWNuOszcbptMCCDh+UH0AmKYVgYJala3P/CskuNqd/EvUdlDkpp2Ew4eSKgsFH33F59NonBInfIfxLpkkyrK5cANsjKqktH4d34cQ+6fbjnj0c+xBGUlUycNKsfip9sDBca/ztJ9+2o/Hx4i2Vhz7Jyr4VSDM7ieT7AZXleEoUw036fusnz35BivE4mC5E+kEnwtS91hbTUVX7FTRVLyPhac7cC2bFoFmQdr7W9hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ppw445+Eap8iBhFZvGNvMUbnLDRThGDCmKZZv+alZQ=;
 b=eY8NL9BnL6OEPQ8tIr4sonqOOeNfGBKct34VvDdh3f9EuZomP52OPUH0GUpE30RQftXBG+JIYQW0AcplrqYyq1RMDll4uaqwxz1ho/2Jyw5Hrs58D4skfx1wnC7BsKbUiv23HnRlvqNcCuTDwOS8dvGDhSfaQ0x/gcQ3BrsYOUw=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by DS0PR10MB7955.namprd10.prod.outlook.com (2603:10b6:8:1b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Fri, 31 May
 2024 18:59:42 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 18:59:42 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/9] build: initial pkg-config support
Date: Fri, 31 May 2024 19:59:21 +0100
Message-ID: <20240531185928.363245-3-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.45.1.275.g567cb0950c
In-Reply-To: <20240531185928.363245-1-nick.alcock@oracle.com>
References: <20240531185928.363245-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0462.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::17) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|DS0PR10MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 19eee7d8-6bb5-4bdb-28b4-08dc81a3d435
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aYVpBmPjoySm7XUYPfHFmDsXIuGAg8wC9PzTWqj/AVERWocwgEiTGeCnpKEO?=
 =?us-ascii?Q?ka1EK4qVppq8dk1exDQtOqvsC9sZ1i8IEovNLutzurzaw4aR6MI9af3ITf2e?=
 =?us-ascii?Q?cGMwz6jR3sVVa7DRzoRnS0JYcdGjD95nzcsF133/Sjq7VdFUEAzaGeimL35I?=
 =?us-ascii?Q?0W2XcQ2XqUlrRU+gFJTpea1pRR+BNilnUvSQH0MXG6nurCv1UtPUBH54ax89?=
 =?us-ascii?Q?C4YOZone8zqSqm/Hd2M/fbIcb+oUUhnQDQ6kFAZ/SvYAGDk0flAkv9RKuc40?=
 =?us-ascii?Q?CSShvE36ht8K9+7TDRN0zRMyo+ImyHOsIEgxqiEtUHjisC8uOvrgJ8/95Vu9?=
 =?us-ascii?Q?FF8ULCQx6du0xf3B1nddePzcNJ0wEWGAxLJYQiEBXHspCsQRo61voLIo2N+L?=
 =?us-ascii?Q?HzzVRcz+ofvzmQF+ehVab9zZNaO2B3u7U5P85lcTuA9qR5ut9JtF22+cGwC+?=
 =?us-ascii?Q?Mu4q1oonPiL3FijJWIHC/TCoFuN3UE5izEwuNL79ntm9y7z3GCiFu2zrNU/V?=
 =?us-ascii?Q?ccjUTGo3TWbXbXR7UWHYKdtq0O1VQ3W44yeM55tzOUUaBpeRw/uVEXkh9YHZ?=
 =?us-ascii?Q?Pl7yid/u1SqqdZVQ6T+4xVhIZL4ECZFml8F1VO/RyaheNawHVyeubXkILDOr?=
 =?us-ascii?Q?QgD1+hMpF/h+jehMQPpg43WhvQEjxQUEb6oEUBJrNUttFaP8sk/vKgRhaFG7?=
 =?us-ascii?Q?RW+mq6zCpQngWZNlKmkJmtCp8tcwti0uSkKS9Ip153nIKoXoifyghWJvyzRS?=
 =?us-ascii?Q?dKSjF5VIRyh1gmN9kxJwcIG47ATxGHDpxctyVbvLGE1I8Nz9lD/oYDBkvRNB?=
 =?us-ascii?Q?tlIGREMfg3r7KkDlrHRDEF2PIQN9ZY829tNlASYZHwBZ3UN/+kgj3tdC5aDz?=
 =?us-ascii?Q?/3va8zdYYFKggUOwm6IpxfTwmbfQrBGdugFMatowkPywqPgaNlkyA+z1NyiG?=
 =?us-ascii?Q?iJyVtlFjjW2dUvQCy5xEz7RsoSMzgekRjMLg1zCEIXKXNMt5txNFGTvbhbZm?=
 =?us-ascii?Q?KPqYt1OszrNQBjksIjRCAB9sEtcCa2tDa8QFKQRJ3NGXxnuqujUILhQhQh5N?=
 =?us-ascii?Q?7ykq23Iz4QPlq9/SsU5n9m5/tw8LGB1j9LNQ2WqAloTesr7JDgSZXhrOaUZD?=
 =?us-ascii?Q?qy8L/Y4YWj9pp0f7fJM3hGoGx9xofEQLgdZqNNzJOzBaFGZ18gh5Pi2T8Kf2?=
 =?us-ascii?Q?2NmEXTNlQAIV80ODvBmLpnClnszMHcyMWjutIrPK2JUg6oHvKZx+FbYsOOxD?=
 =?us-ascii?Q?NvQ5EIp2WRIpC5SmR073+B+FRBs5x/QbHNBYe2165w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?An4V2vzg9ja8CmNfxwz6Vy5fb5t89tiIb4KR9SkNy9svuhK9PITiaN5UlNdB?=
 =?us-ascii?Q?H5enXNkRkj7EsvgpmsoLI9ydrc8LFxwdg6DTYjaTgpPsV/3IYkwyytVBseCR?=
 =?us-ascii?Q?QFNczpvxzmMF69KCukZZfDxUkScqr19IdJf091WM5ZBB7qWTHZnzU13oL5NS?=
 =?us-ascii?Q?FPpMZPm8QkC2qAdVSIjUC/m6hrz0GJhJusrN08pA8xuOPMRkkUYDBYPfLGTx?=
 =?us-ascii?Q?XBnLGEsyF+S7fKl2hA9wnRaEaEfftEEzrt4f+445mCJ2ru2zL0ZYsGZBVcxR?=
 =?us-ascii?Q?9cXWwED/pBmRXFE1tWPhp1OhAlfzNabbMWIC+1uAoqdjvM7/Al8GhW+/TyD1?=
 =?us-ascii?Q?775Qpbym7IptLXATxXgB20yWpYDUG3ozQ7EmEXal69ovnE+CZD1XK9a41ZYK?=
 =?us-ascii?Q?8zR8SZUgGynd/nYZvPfvIpXkfsKoCE6A+C/GHAe9UJJHQDy7jXlABr5KiWQv?=
 =?us-ascii?Q?EYymtcxDF45zuKIRW7JSIVX70WNA6EyLnRgdXQwgzZMozoKraXSQKK5HTD3F?=
 =?us-ascii?Q?523X4avkh1mgqmF9jDGLJsWOiPa/EJFYiDNpHLTOU1GjFeymGg40/2L26rgJ?=
 =?us-ascii?Q?4YBy5QiutWeFXUMRP1Tn4/EGdcCRRHUQRiwDftHu+wUIHnjKGbrzFBr3YCWe?=
 =?us-ascii?Q?16XVN61tKM7JaWITQbjJmJZ5cosnwJyufHu8JnJX2zhu2eC586v6B94c3u2P?=
 =?us-ascii?Q?oXfOXFpnX5Ic76oHlVkzjNYnQtP4HcbcwbnVhj72FQNKUSc6e905w3d9PsM/?=
 =?us-ascii?Q?gHN7IyAySWmx1GPCgkIirLRkGfO1BHXlWJdPzSsWmz2tdFcSEUnAResWiQ2g?=
 =?us-ascii?Q?MjWxtJcXKEeVNASijUc0rFOuKaIBckuHBU/cTajQuleiLw5wg3fK4fQv798l?=
 =?us-ascii?Q?kSFadR5L/TROgRdgCzHutinAy3CCFHUqZ7tsSLPGrrrAyEUSY5/+6Bo9cTZf?=
 =?us-ascii?Q?CAk8x5JAV/lFP/BZR6zrXk1y6ZnvcfVrVSwOZVE1sUP/rHd6rueh/VmILLSZ?=
 =?us-ascii?Q?RcvYI9YDjS64U7m9+I0pG3RTwP4afv/hmoIdJerTVmNlgPD74fmGkzrfAJc8?=
 =?us-ascii?Q?e3KInQHKMLY6UMaw331jqiSGF075tytkAU5H/PdSLXRjR+J1Vbjv2apXMKmr?=
 =?us-ascii?Q?Im1n60qHMGxbbmxavnG5EbuvNwCXf2njHkuuWkGztptEoh2GcEUBKQON4WLG?=
 =?us-ascii?Q?EWM4QzcFEnHdeFwW9rHvdsP/QHMSX8QvZjsWqJznbHQOsDxZceYBXClWUErL?=
 =?us-ascii?Q?wLrerGAOcsshElv+XqI7EDHPJvGYt0qto4D6DFjVa8k17htaqTC+R/7Al1GF?=
 =?us-ascii?Q?E4HXy8vede8XiDCiHqwG3+GnDrsOfvzEgGxyxutnnIdh8hGITh9UP3eM33cd?=
 =?us-ascii?Q?hoaRB4tde4MSX6jkC5Q9Astm7Qqw24d0iBniWmsE3MgSgtMQpy7rpydKLdwH?=
 =?us-ascii?Q?8YQ4ieYnm8M5LUE4BQAPILwGeYS7hWDduCkcTG6OxxXZcz78cDTjJfcd8e+b?=
 =?us-ascii?Q?NrzPgyTMQ4mxr42mxWu3ftCHC71lXh5IFf+rUNPZ+C2VcAsgZi1n+ulyBWlR?=
 =?us-ascii?Q?DP+F0q0S4VJ1boCu58HY2ImC4oiVp6RFdj9oWDkB65OrapLGrWcI4+tRY44v?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	OcP0AIrae6nFrL22Tdln0hTmKpaQLbnNNunm6UDSkbrYx49gCgrDerUfqREJkJDCBeEiXaWTp6a6QP+L1xEi4YNVa2L0+tgvoRteGN2r5BbegrXAs++JjcaKdguWN6MqlaAH5CKf5Ydd0mb+UDuqEDAVLEONc98hwc6fd3nc4+sqi8LVenIm6rhVgGaxblypZvMgy7DiAVlQg6C4B/WKGXAmU791CXTguzBB+QdbwNFnTzzCwz1wcijDAANJTYlCKH2AWjEY9/mXLai6iJ59VcMYhkqNNVxQjFhvlilC5ht+vJeQgJ1MA2zjiy6nnaCmK0iC3GR42gVTyTnp7mr+jQ7cTHeFFi7EC2RSMg1P4abrY2hyuEH+h78LorWxxURCTa+7V5onoQjMdjWJsdmViToxnM/bvgnNUKjeD9VZnQ4LrSEi3NdoVYjos74JT0fp0v77YGviTGhG9nKcqdZJzycSKR8ZSDJO0fuMNC2BsJ8uB94KFc3WA5vHban5ZruajwMIJB3FU1TMBEkw7XBd1yVEJLFKfeSz0/3fIpP2lmvEm5kZFhxzvix9aUUuARi9gbXe1Q+XL0l3fhFMelCy+BL8PFCOb30z/ezfU7z7J5s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19eee7d8-6bb5-4bdb-28b4-08dc81a3d435
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 18:59:42.1764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcIAM6u5awMTRt9XZE23c8W2wUymfJ+9M73/OI7s0nZfIUbPtmTRCGj2Fuodtgp4hOq9+snUOUgNtvaD9aOz9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7955
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405310145
X-Proofpoint-GUID: 03D964svZLbM-XWIeES9rEbpYAMqm8EQ
X-Proofpoint-ORIG-GUID: 03D964svZLbM-XWIeES9rEbpYAMqm8EQ

This initial pkg-config file, dtrace_sdt.pc, points at the location
of the sdt.h include file.  We immediately use it in make check in the
installed testsuite, compensating for any install-time changes in the
location of the dtrace libdir.

Further changes will be forthcoming to properly support relocatable
installation.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 GNUmakefile          |  2 ++
 configure            |  2 ++
 dtrace.spec          |  1 +
 runtest.sh           |  2 +-
 uts/Build            | 14 +++++++++++++-
 uts/dtrace_sdt.pc.in |  6 ++++++
 6 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 uts/dtrace_sdt.pc.in

diff --git a/GNUmakefile b/GNUmakefile
index b1109727dc66b..0fc9b3b5e85cd 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -100,6 +100,8 @@ DOCDIR = $(prefix)/share/doc/dtrace-$(VERSION)
 INSTDOCDIR = $(DESTDIR)$(DOCDIR)
 MANDIR = $(prefix)/share/man/man8
 INSTMANDIR = $(DESTDIR)$(MANDIR)
+PKGCONFIGDIR = $(prefix)/share/pkgconfig
+INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
 TESTDIR = $(prefix)/lib$(BITNESS)/dtrace/testsuite
 INSTTESTDIR = $(DESTDIR)$(TESTDIR)
 TARGETS =
diff --git a/configure b/configure
index c423bc82b7637..462548bcc69c9 100755
--- a/configure
+++ b/configure
@@ -60,6 +60,7 @@ Installation paths:
 --sbindir=PREFIX/sbin				Alias for --bindir
 --includedir=PREFIX/include			#include directory
 --mandir=PREFIX/share/man/man8			Manpage directory
+--pkg-config-dir=PREFIX/share/pkgconfig		Pkg-config directory
 --udevdir=PREFIX/lib/udev/rules.d		udev rules directory
 --systemd-unit-dir=PREFIX/lib/systemd/system	systemd unit directory
 --docdir=PREFIX/share/doc/dtrace		Documentation directory
@@ -130,6 +131,7 @@ for option in "$@"; do
         --systemd-unit-dir=*) write_make_var SYSTEMDUNITDIR "$option";;
         --docdir=*) write_make_var DOCDIR "$option";;
         --mandir=*) write_make_var MANDIR "$option";;
+        --pkg-config-dir=*) write_make_var PKGCONFIGDIR "$option";;
         --testdir=*) write_make_var TESTDIR "$option";;
         CC=*) write_make_var CC "$option";;
         CPP=*) write_make_var PREPROCESS "$option";;
diff --git a/dtrace.spec b/dtrace.spec
index 28eeaa4783769..1887fcadaed62 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -246,6 +246,7 @@ systemctl start dtprobed || :
 %{_libdir}/libdtrace.so.*
 %{_sbindir}/dtrace
 %{_sbindir}/dtprobed
+%{_datadir}/pkgconfig/dtrace_sdt.pc
 %{_mandir}/man8/dtrace.8.gz
 %doc %{_docdir}/dtrace-%{version}/*
 %{_unitdir}/dtprobed.service
diff --git a/runtest.sh b/runtest.sh
index 3bcd676ea788d..cc9703e12c161 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -579,7 +579,7 @@ else
     dtrace="/usr/sbin/dtrace"
     test_libdir="installed"
     test_ldflags=""
-    test_cppflags="-DARCH_$arch -I/usr/lib64/dtrace/include"
+    test_cppflags="-DARCH_$arch $(pkg-config --cflags dtrace_sdt)"
 
     if [[ ! -x $dtrace ]]; then
         echo "$dtrace not available." >&2
diff --git a/uts/Build b/uts/Build
index 864b2dfdacbf4..feafa21369f2e 100644
--- a/uts/Build
+++ b/uts/Build
@@ -14,11 +14,16 @@ SYS_HEADERS_INSTALL := common/sys/dtrace.h \
 
 # sdt*.h are used by programs that contain USDT probes that want to define
 # probes by hand rather than using dtrace -h.  SystemTap has another header
-# with the same name, so we install these out of the way.
+# with the same name, so we install these out of the way and provide a
+# pkg-config file to pull them in.
 
 PROBE_HEADERS_INSTALL := common/sys/sdt.h \
                          common/sys/sdt_internal.h
 
+# The pkg-config files undergo a few translations with sed before installation.
+
+SHARE_PKG_CONFIG_INSTALL := dtrace_sdt.pc
+
 install::
 	mkdir -p $(INSTINCLUDEDIR)/sys
 	$(call describe-install-target,$(INSTINCLUDEDIR)/sys,$(notdir $(SYS_HEADERS_INSTALL)))
@@ -26,3 +31,10 @@ install::
 	mkdir -p $(INSTSDTINCLUDEDIR)/sys
 	$(call describe-install-target,$(INSTSDTINCLUDEDIR)/sys,$(notdir $(PROBE_HEADERS_INSTALL)))
 	cd $(uts_DIR) && install -m 644 $(PROBE_HEADERS_INSTALL) $(INSTSDTINCLUDEDIR)/sys
+	mkdir -p $(INSTPKGCONFIGDIR)
+	$(call describe-install-target,$(INSTPKGCONFIGDIR),$(SHARE_PKG_CONFIG_INSTALL))
+	for name in $(SHARE_PKG_CONFIG_INSTALL); do \
+		cd $(uts_DIR) && \
+		    sed 's,@SDTINCLUDEDIR@,$(SDTINCLUDEDIR),g; s,@VERSION@,$(VERSION),g' < \
+			$${name}.in > $(INSTPKGCONFIGDIR)/$$name; \
+	done
diff --git a/uts/dtrace_sdt.pc.in b/uts/dtrace_sdt.pc.in
new file mode 100644
index 0000000000000..c5506f9355d92
--- /dev/null
+++ b/uts/dtrace_sdt.pc.in
@@ -0,0 +1,6 @@
+sdtincludedir = @SDTINCLUDEDIR@
+
+Name: DTrace SDT
+Description: DTrace raw SDT headers
+Version: @VERSION@
+Cflags: -I${sdtincludedir}
-- 
2.45.1.275.g567cb0950c

