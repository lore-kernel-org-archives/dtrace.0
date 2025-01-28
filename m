Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A6BEAF6
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 23:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738107322; cv=fail; b=l18Wok2lzn7DxqljPvsUInwtJ1qDFZlwG3kefmCtCa/jftaC4bkW/POopdG5GpCXyJPx+gPoONyOQBmXheA2PSALbWwDzVxXasfcNgzb2LMy2Iy8gnEbbKQA32a746fO1i4PebqelPzSt9j67ASz2Awj6aU+NiLYswKCs1vm6mI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738107322; c=relaxed/simple;
	bh=aURFmPFcfOrfTmkqH88+hdg39NOWj9SchKRv6jgP+Fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EMpS7vIPYjv7usJ6emqSxIxRa1H1hAx5hF3kGdQ1lfeA96Icnv69pG2V9/eLuc3i3/iyyo0kshd79KSusYUwvZ0a+wBqEwQsNQfqUnzhavVw+WR25+JRWIqnlC3/MlArkhqkHnbtksKG+1f/VP4n3vwjWbDHJi9/kgs5+ob3r4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bZWo+pKc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HwneGX2y; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bZWo+pKc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HwneGX2y"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SN8K0C029025
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 23:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=mxcEcqZlcyz+AoS0/F
	PcMxsb2jBLPlY7mjEWE6e1H+g=; b=bZWo+pKck23k/GEjM0H39BzBM2tfGLjRi+
	myHD5b5/+PO6j1hD2V59iAkvCB9/a0VSKwy4ZjWNA23KgbQ1YT6iZNAP5ukPKjgN
	l3RpizlnVQQ8eTGDWY7K5wOYkU2++95EOQrTWJt+EkCX4aqAVWITJFXQKiMDkpnQ
	ier3JF8xaIgclR6kP909zTlxlwQsqtpTHaOU8bMJyKzSrMrfH/oBtaUDwAPqvkMX
	x1hskcdDwCHCUK0M+Zat0G7GTQsW529C5JRw0BeTW67tyndVDwPLC1Ge+ieyuFTi
	oSFMn+ZmlIsJ8IwU1GXr7YLdLD/RL+cRAMTF97h0Gf+57MWe5y9Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44f8mg00w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 23:35:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50SN4Nh9036793
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 23:35:18 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44cpd912x6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 23:35:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ct62FrS/8icUu1ls3fiNiYjBgZlmBDUvAYaMgRxnkMKC5lQcvXVhZHETszzRvsXihypyyePXjYuaEkIiUqWUGO1Xz4VjFS3y32kDOZ5WrVi3/oPW4A6I4lBJrBWLEXaeZyt4GJOxRnifX+zYj2G3x1jJw7yhNHufoL30NMO34cdvAFZy6hVjc01Dm95QXtLVDAL9tCJTv2Jt91xITEAyRnAErex9w08TyBnKqptA8bQw60W+2CbIOKOSlUzAhY2ygKSFpQ6TV9ENIQXYGYGLaYwVSn5RB13Ewjy1s6JeL/v2fQyMAO5CiBVxfYmaoR2h9oaiW17UXlCdZFNCYmDKnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxcEcqZlcyz+AoS0/FPcMxsb2jBLPlY7mjEWE6e1H+g=;
 b=Uk29KSrFJd4oORNz2jotXbPCyItLdjPjbz/KkPOYwpCpoK9AUC0j0z14KFk9+gdIDLyny+yxURBWJBDCX/JCOld4aBDr+471uWxx/ezOjZwdrp7TsJsqxVIkzgu3vKNwIJ2jQFjCgbIMQw+5rkz9jVV5u+BcWigeXir1XDKEqU6/RnN5SgJPQd9hmCpawQPT5YddUo0mwufKXOyFQ9/x31uGVud3DOx2+owbpYBepDzZWOgGKvd6O748a+qCD73GAdZFKJUtU4C6GNEknULTPHDS+70xOMLhyXJkvhTjF7gbQHM0rRFNjmYpkQ5hUHzrBe/lXKQgLHvjGV+nu5sjjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxcEcqZlcyz+AoS0/FPcMxsb2jBLPlY7mjEWE6e1H+g=;
 b=HwneGX2yI82YEP5yn7X7IfUsuHT+7oObhODAK2wb7iS+Unx3FAVHxNA/oyxt+YVel2tl7WZ4ySXdNzljJY39ioXe3b+XesPhHCwJ3p14h/fABDocLlG1nbHnlq/F/YiewP+P731y3J6tUq4HU7dxwTMbWEMkik8Fxk8YBqBfVIk=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CO1PR10MB4484.namprd10.prod.outlook.com (2603:10b6:303:90::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 23:35:16 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8398.014; Tue, 28 Jan 2025
 23:35:16 +0000
Date: Tue, 28 Jan 2025 18:35:13 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 1/6] bpf: separate bvar implementation into separate
 functions
Message-ID: <Z5lpsQVsme+dwGVa@oracle.com>
References: <PH8PR10MB633775D451C8DC2B4847D601C2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
 <996362c0-a77b-9265-395b-bfd9d17e9343@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <996362c0-a77b-9265-395b-bfd9d17e9343@oracle.com>
X-ClientProxiedBy: BLAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:36e::13) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CO1PR10MB4484:EE_
X-MS-Office365-Filtering-Correlation-Id: 12808444-f53c-4060-521b-08dd3ff46b5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A31morQUDTHJC4CZAn4oSy23DLNGkyv+LbVN2O1S1FcUOZvs8UqHNOtQ9h3M?=
 =?us-ascii?Q?fyeshqMDmrVSuV3v17is7Bet9l1ZUwDMaMaDXoc9TAG2Ra/cOCk2TNN06C9B?=
 =?us-ascii?Q?pUNjN5dUZvtXXUZwlwFsmiTOelJltKb2PH9b4a/dnlEYYn7Eo+mivfwf7cCN?=
 =?us-ascii?Q?ciDeldWBnc2/wtm++ykrEG9Uoci+EMWNGkSgJ6eiu0t+1pEOXTsBSmoAB31+?=
 =?us-ascii?Q?xEdjBYC72TT96eN5rm7ktkDqizLUxXBG5IrN83xKylmSTLycCJNbuQKM2Wrk?=
 =?us-ascii?Q?61pgBU7dSiTQmM427gDPnpX+bgxKKvxbV+LAIyNn3MdiVbfcmPua7l/XaHb8?=
 =?us-ascii?Q?ASmHtlEGpWyswLTDg6mzRFAwNO15Bttc8pQEek6sZV6tcQWA34a+BP/QXV7T?=
 =?us-ascii?Q?XGExnYMt05Hr79EsZFOwNDjlfMiZMNQjXXXdFTt4j/77Zz+xKHbiCfV9E/gN?=
 =?us-ascii?Q?wEuNZyu1Sv1YyJKf0DI2HNgVWB69Ly8ruO5uBrvojNuS5B6IoB/wUPun2vV4?=
 =?us-ascii?Q?GSbsrJXOD8uj86yj7L9pzQJHUpjY+WmRIre3Hg0bm/S2J9jwAkKXnyMMSBRk?=
 =?us-ascii?Q?NNOnmw2wiL358bIibUIIG2qDCT6Dgho43O98GsCKj8j6lujzjXvPrp2lcnsX?=
 =?us-ascii?Q?d4e30A3NafwBO46JjFTNZw2SkWIlAWGwpquV0LfqgrGVZEgBujHDK0UtgwtE?=
 =?us-ascii?Q?4YS5PjN/+8epzDFggjOTOh39m4E+/uZqYe7eHwDZRwc8Pwa080Sgwey+1/tw?=
 =?us-ascii?Q?mEyLLpeJ+y7QXzRXR33BsyXcl5/L2WhO9KVcrx+tlppdG88SvDUdp9P4596e?=
 =?us-ascii?Q?Sg6xoIX8dJhItL6YtArXr/K4QRk/m9lyV7l7XE7lZWgHzUQiv3OM5GJRc02E?=
 =?us-ascii?Q?KjUKp6OqtaQn/jimzn1UqMqDRkqQPz1br94pFxVMVlZktsUR5+w5mqY/S/ry?=
 =?us-ascii?Q?BjRfQyHP1hL5yPyasj5oBb9tn1pcDiOqOXApMg4qKdB1Ii2KqrQPUAv7cHGi?=
 =?us-ascii?Q?gdw4k6cgYpZ+5RJ3wEYyhfqz+Tb+lZHgTVJ0a2KzixzO6Qll5ndPcWuS7QL3?=
 =?us-ascii?Q?AvyUT1EPwUr5tLzcz5Q0f8dr7q9ZNn97UgufdzkvdZtazfN6LWvCsDH1XzG2?=
 =?us-ascii?Q?YhelRVeDVbxtpKHK1JLGwT3WGpOWG01vydOtasfbxnABL6/IRV2EURwomRL7?=
 =?us-ascii?Q?ea1nG/Avs742ABG1870xhUaOJ4PztBxq+FiTimI5Y7J1PrYANo2gNAwP4xYz?=
 =?us-ascii?Q?IlJNlK3Dtwqy7ZEd/CDrgDqVW68EAYuY12PsJnOzk3SKxuEWb2kUJm+w4iIb?=
 =?us-ascii?Q?vHUsTFXlffq0RfnZTSg7d9rXRNQCRAdqN4NpBJc218QZtoriIO/xZaTHJjLH?=
 =?us-ascii?Q?XJX9o/4v9CGJ1N+m2/31aFOXd1qq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZQMWPMJFh5pHrBQE7CPNXrKl89Mm2XnhBaC0ZQUJQD5Y+9/IDMkVFuJzMr4J?=
 =?us-ascii?Q?FNrJuRJgwNinSBK2P5u2KdgPjAxH3nbJQE3/emCofxe8PMXSxHz4StzXXA0l?=
 =?us-ascii?Q?npWINrsR/ybMUo9ewOo9+hg8qfU7p6ghRx+pcLA3KORJEGfIu7vYZS1CT9AM?=
 =?us-ascii?Q?t7jw+O9SL3Q2Ezv5+rqMtVsbGoyKuv8yvcAAFKrls2tsTGQAwfyGrbrMydfp?=
 =?us-ascii?Q?qf/M4wJn/gqretS0CX9+8fsx2tSZ1JRsJzqvBSHstz1bU/npL1QZ0oatuzdX?=
 =?us-ascii?Q?9BSQHt73AkGpdWvLsJtwF2TpQfwfhaf1xc9AS1Rg62hdY9QLcB1ol1wugtaf?=
 =?us-ascii?Q?uJ/xAXFHp5kOVlbPSzYSQ5W96y0naS7yDF8uDQzNOo6Ga7NwUIdSy66GkoJZ?=
 =?us-ascii?Q?5enlaV5iHkU7PgcJY7KpU63/cCcs9kpeicdHwygKDdLRwrYyFr7oRACG/qr+?=
 =?us-ascii?Q?30flt2vn16H9X1Gnpu8fRYv9J765Cqz4p0tIQhivNlUiE4azp5s/wk32WWmN?=
 =?us-ascii?Q?ePk56Q7xCqftchDvkS4Ywm+J0nvUu5pKWBM9Yy2MPOAzS/0swoO+OwGmE9Gw?=
 =?us-ascii?Q?7wXDkFYoR7hG+qJuPM6z3x/EauQZHF68o6TSIuRddud8MdpWFHjUdbRO5qFh?=
 =?us-ascii?Q?J8PxB7K9C1Alw/beLsMC05j4xqfsTygO+Ty4gJ6+1nhDs69J9HrOHD7R0IH6?=
 =?us-ascii?Q?HsT4l4O1Uu+qDlLk7H41+xarqsGYzKenIFcA0G23wu8fN1o/DSTHYRofhjlG?=
 =?us-ascii?Q?DfKuFJvXeGeo5W+v9Lva5Kjdo0zloOjPfqloCb9GsoaLEwv3zaPPfMumvco1?=
 =?us-ascii?Q?XZWe/SEGsvA/K3GVYtxXLyDGlUzOE0Mg6mS/1wtDxPRPHODCa6NXctD9Mv7g?=
 =?us-ascii?Q?XVtd6llzVKLI1CNsZSEZTvy7LK+hl9iEESsQqspyvadzuGzxV53IjgH7WV7P?=
 =?us-ascii?Q?HyYqpLl+sHbwuCmaCCS5yFMAOc0/SUrS6KbEKaCx8hThBqb5mzw5NXenKFlK?=
 =?us-ascii?Q?3beRnIjCmM2/hhnmW+bmU4RRxw3o+4prbplBnHqm5gb88B3wO3nz8qtVk4A6?=
 =?us-ascii?Q?TjNd/ogBDEHjwTzpy53C+0KWBBs3eLlh5GW8oGSQ/m02K1miz7BDouSZQHco?=
 =?us-ascii?Q?ROIq+9wuLwe5Bafe2dex42Dri2/4ZCWD1D0X969OLm+ov0J3WHcbLCQEKKMm?=
 =?us-ascii?Q?QerbERWiCjHZeKucQbnw3lckwqVlbZsnB9Gvw4i9onpAO2OSwYmGlLCTqh6/?=
 =?us-ascii?Q?zJVugJLswVUNUNk9JRhTbUNW5BgRYL0qatZ7d4oy75n+iWjtlFPrezUfsgHS?=
 =?us-ascii?Q?foK2CfoCsoBSYsCoXleZ8OgnE5LlZsYic85BjBwgy3Nb87EOGZpwNTRY3BEV?=
 =?us-ascii?Q?AKhiVr/5BNXJKZIaIwt5KqzgcgdGD88TGOM80EsLWitE1wuWHwtrMFf5mxrB?=
 =?us-ascii?Q?DKDuameklpxRMIp6ZG8b4c4SgSPVTnYxUbUQYGbei0jMbUif7g04IXR5Fscy?=
 =?us-ascii?Q?hxgJn+xYjqRTbe6/YkpAE37uVpIvpY0GXQlnxAVqBu7vAlnNFP+yBGjv0HhU?=
 =?us-ascii?Q?t20SC8sMrsdrgxhJnseM6W1P1XPlowSsPbIoBej9gkILP9GNBRkyMxT3zpIv?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HUORAd+27skkOOUuU5G+jNEnxohzcS1cVZ3KE+MV/gMpWu/GIFWGJbNDVBK//ENkVNiZQBYaPUuMF23Trm0PalwVqXrp1DP0TZvLHiL2f3vnmQ7+gKTUE5Kky4ai1BnOVqFSdOr5Yaty6LOvZ5pSuwoUUayhCAY+berAufzAUgd6jkbOg4Fr+do57XBsrVcKd19L2dT5zkhcCRyMTbTcYhdEWhowyjpzF/jaXJTCtfQqa0J2sF8oV8EehtHVa2k6BO+1J6u/iHQDdYqCgxHgMwklBQCR+zv5X3TYo77eXEQy4qa1nPHkWRkXTUhMK01YnvcPHskkAzWG0kxLuYzh+0ULY5aYxdvqqhaQHPgLIMymo3taBqpgBtT9ha7OTwGpBYiftnL6oFBnz9i9VqurmkohoztoZdrUJ7LOw4Wcrh/TzsEV2WJmjy55MwAjdvP0qbn7N33nT82bFRxxpW8rYW1DUAPNNwi8Uo/ut3VfHpSjMpbNW/s5OnbbKazMYu6D1pGpVdrlsX6wevekttT3pvqxwLyi+2cklBxsR2q/1mvgC7N7Qp9QirfR6Wo5z33HD0w5RNnuv7yIgnM9OEI2ftD7fyBdgzmC/hEPKkqDRG0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12808444-f53c-4060-521b-08dd3ff46b5b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 23:35:16.4407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bvt+nm7gVFImF9On3vquml8MlVD0F6ZghjY7GHY3LmUYph4xfOrL6SBsVse+UaaTLmYrnpDsVqWiA1osEn9u0usk55iJfIKxMuPMN60asrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4484
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501280171
X-Proofpoint-ORIG-GUID: _GTMkHVdT65PpYSWDPVD0BI4LODbVgQK
X-Proofpoint-GUID: _GTMkHVdT65PpYSWDPVD0BI4LODbVgQK

On Tue, Jan 28, 2025 at 06:29:43PM -0500, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> 
> If there is some quantification or other characterization of the benefit
> that could be added to the commit message, that would be nice.

Sure.

> And...
> 
> On 1/28/25 01:31, Kris Van Hees wrote:
> > The handling of builtin variables was done with a single big function
> > that therefore got linked into every single BPF program (twice if the
> > builtin variable might raise a fault).  Providing separate functions
> > for most builtin variables reduces BPF program size significantly.
> > 
> > This also reduces pressure on the BPF verifies.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > 
> > diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
> > @@ -19,18 +19,21 @@
> >   # define noinline	__attribute__((noinline))
> >   #endif
> > -extern struct bpf_map_def cpuinfo;
> > -extern struct bpf_map_def probes;
> > -extern struct bpf_map_def state;
> > -extern struct bpf_map_def usdt_names;
> > -
> > -extern uint64_t PC;
> > -extern uint64_t STBSZ;
> > -extern uint64_t STKSIZ;
> > -extern uint64_t BOOTTM;
> > +extern struct bpf_map_def	cpuinfo;
> > +extern struct bpf_map_def	probes;
> > +extern struct bpf_map_def	state;
> > +extern struct bpf_map_def	usdt_names;
> > +
> > +extern uint64_t	BOOTTM;
> > +extern uint64_t	NPROBES;
> > +extern uint64_t	PC;
> > +extern uint64_t	STBSZ;
> > +extern uint64_t	STKSIZ;
> >   extern uint64_t STACK_OFF;
> > -extern uint64_t STACK_SKIP;
> > -extern uint64_t NPROBES;
> > +extern uint64_t	STACK_SKIP;
> > +extern uint64_t	TASK_COMM;
> > +extern uint64_t	TASK_REAL_PARENT;
> > +extern uint64_t	TASK_TGID;
> 
> Did you intend to change the indentation on STACK_OFF as well?

Woops, will fix.
