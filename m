Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902A528DA5
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466515; cv=fail; b=Mk9tH0nZ3WS5lNge2zbtwsrjcEcRZMGEAUPb2v0HYhR2NdgfTbK5RuPp49LUYFSFep38fvWeuIRlVVNluBg/Hpn3K37Lp0oIri1c4mVzjULMXSGDihi/T066pyHlxGsAJsia3X6gqycYBOuixu9ceWNVaAXtTw+XLASipPs9OLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466515; c=relaxed/simple;
	bh=DGV+AsQY27j/dJ0EFJPZk+WtDvAicmVwX62LhO7MAEM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kQdsyH+T+MD7+axsugjOYGEh9Uvlno1bcTr5CKcrjoCTBLmGbDjL30UxNRBy1uUfkJx3/aBPRUDOx3CqC2SJwI3jdkMSwlXe5ZC66ke7DqE7CU6bFNOxvEKevcEi7OPGEtOnyr8VdbxCmIAOnofHynHvoCJbqk3zDlGa28xeWSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GUGjeWn6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OjJRTnAC; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GUGjeWn6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OjJRTnAC"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMUHL006680
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=XrG/oTJWmhl/pO
	WlYVnvP509MgEbRwhLdDsBhL3RdAo=; b=GUGjeWn6RrUiTYW0YOkWw23Qlzr14g
	6iNCTGW9A3K6ZNU+eDKrICAKErqp0j1lzvMzEpjOmdhZoVcCVVXYJafQEV2I+6+6
	2I3UlBtVnCaSfm9TKSh+8JiyvLXmeb2hYAcVlBXvB81d0Ni0nK4sxBtEir+9sIP9
	3BgfYXenC4DY9WMnORSykFsFdW7UcldOrZQE/CE0nia+EjXf31nkv8gkTnfkDf6b
	Hr/t2/C1drJZck6sYLJTo4U3tWuJAsl7lUo+ASNcb4iAf+mWeD57c6+4RSZE7t/S
	OFqHP9YotCbEwHctTLpOBzcd6AhSjLq06MPozzBG+sJ/0TpoRQv/mkGw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 400ttn8hy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R3s6fl037048
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:11 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2afcwu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtK1QtdvcTSKJNB99Hat4VB9TI81WqyYAKmrhJCDgdKHOUV5eK/4YoIO+TKa4yM/vuR5YjvSiWhOnogPpyr2hhBBA9vsfV9WA9G79LHnBX2vFsbJLQZfqaCat4zg0PDyCkrh2cLNMM0euY9/6aqeIdfcJER3EHWEzWrkh14btQgRlJVhZHaxAhYaSFBZ7VkFS96ajqNg2o9gcZKfy1vC3yDieT0obMmI5u/RxuQyP4A6DUXTGyBrTt5AyWmMsx2yJm5Ei81HvIzbubi4U+nIL46rvO1gWbfwYacTmLP2TJ5WhSEX69Lep2B0EAOmjJKvPwfIP8lr+riA/sr1dSTm3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrG/oTJWmhl/pOWlYVnvP509MgEbRwhLdDsBhL3RdAo=;
 b=Mip0//apBcIGJC+QSKDW8Yjc/W1yuQrAeH5CcurTU5rlzoAXHdQWJ+M73FG8JpKuBYwn/ceS9jVIbFE+VdQmluhNcsKsCeLxpyiYga0wVpOBrBFfSPHc73IceI7PieIuIeQhBd7yep4SpHhJ46EG/f9wzfZOl3Cs6qvZerKTEZ5cjTLRouQxRiMZEFQ3Wkig6c6OGR90fl1gwgBhivwidFqCfLRkX624duAGEGhHo2rzrq5//tCYdt60VhqqWTYoortX0iaHCKaxZ4c7bax2vFTrnejd6IRGH5+e1O7TQbPTXmOgfDmpo/k6izeOguuyDCkvxxtl5BpZH605p+YiDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrG/oTJWmhl/pOWlYVnvP509MgEbRwhLdDsBhL3RdAo=;
 b=OjJRTnAC78HgqP7jspnGr9CCoMbQXO9S4z1kNTfP+haXu+rwFnzISCN8fEPzd+zzUiEeghMaBKWo6rmE6oJmM9eGg5mmzKfGQw8tD2LP50IjUGO0LRCyhXOQK/mPNCOhh7Ud+e1E9syDoasSp4PZ9UBWrB1oqqodTS2yoLL8sMQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BL3PR10MB6041.namprd10.prod.outlook.com (2603:10b6:208:3b1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.33; Thu, 27 Jun
 2024 05:35:08 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:35:08 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 01/38] Move comment closer to the code it describes
Date: Thu, 27 Jun 2024 01:34:18 -0400
Message-Id: <20240627053455.21567-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053455.21567-1-eugene.loh@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:a03:338::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BL3PR10MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: 5928a2fa-0814-4923-f013-08dc966ae7ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xoqpk8EYopgW0wjAAvykFo3kQFpyZymHwPHkwhKpbP6Mp65DPTh9bZoSI+j1?=
 =?us-ascii?Q?RJpAthAegZ145k+wIlJ/R3Hvj7GEMxbVaP7jgqU5CfC3oLfB3bSkWuzZNglI?=
 =?us-ascii?Q?js6LqVdM71aEapVJAvktDe0zPvecjj4huRosuwLziZ1TeoBIXWEXA2+ICHAA?=
 =?us-ascii?Q?pXvh9A56wNhI5rdf48b3+aOHy82jJ5v3ViXdj+GCtZo9OjuUmb4TN/9iWZqC?=
 =?us-ascii?Q?8X4jr0NQfkTb0CxAvsceDkfSzTikwlEzZz2qEVgvgYybR7ESdrD1ivC90Jsz?=
 =?us-ascii?Q?DrTkiW4wlNY5TqzOgdBWcZ0+giNv6Oxg74l7fZJxtM+vfVjniYpEBHpWjk4E?=
 =?us-ascii?Q?6lQh7TcA2rI1GXGrUz54oYOxv+6ieFyCA+KJbzZ+elnJ4eJ4Xi6VMF1VAomE?=
 =?us-ascii?Q?zjivaMvOdjhBPRIx4I7ZI4FTCVnm2kgM/fjrAcxDlX2Npd/6R8cVwT1iWTdz?=
 =?us-ascii?Q?l+Puz6DqAtzgiKnFKUx5P5rOsfZBzXCwAU3SJKrHLy+WzHzFdE8+s7nT07NV?=
 =?us-ascii?Q?HX0j5fvNSWNbcSrfYhJLpHenP5+jMWZqbdo1Mc/wEs3TaI5uIyN7VXm22zZ4?=
 =?us-ascii?Q?u7tJqrJZG/p82uVMuXtWBl+JYuHr+WHdKF9BOrgFRKc/Npx06EolTdQ2l/Am?=
 =?us-ascii?Q?+D+fTskvB6hI4dFS6hkzbzec6BoQB0z/dO+ECawKWGARnN5zzY2ecaZjVgB1?=
 =?us-ascii?Q?9acGwcJk8xgeOs1Hp3L264u4BREDODBF329YsKggqVOpbOy0Bypi0xhsqmEw?=
 =?us-ascii?Q?VKeJA75Sq5b+T9Oxa4mZCKec9M+NIX4CfbZ0VZU60VO76r5EAepzm7Y7qBJb?=
 =?us-ascii?Q?m/rUhU39x3x9T/wOHAl1aFR+Lj/aZsJiANY2oSbpyaewfhVsY4cdZ9QHKrx7?=
 =?us-ascii?Q?xNa9NSu1CIIuuvECjNa6lZifUqhiqzho797y/+1pOqKF5V2z2vIcSzRQ3hu2?=
 =?us-ascii?Q?Vz3YjRVAVyzinzdp/o3zSW4WWlHBMM+FXrB0pTadeYqgDzggGvZxwDVL+OWN?=
 =?us-ascii?Q?B94atodUASMdUCXHpNipVcT6lZ0ALtMRKvzGVeXr8+dmboWKQ5LQKLdpzUq3?=
 =?us-ascii?Q?Yc7O6LX0kmn/1BqcA2PiRPS0av95jpAUoAAj7gWBtPB82vDPDlLGJtUPteAH?=
 =?us-ascii?Q?sJpT1ll0EI+YZCNtqi/GzP0QZm1baMovgbymskK8ag0zFErGj50leB6Ib65V?=
 =?us-ascii?Q?7BUpe+EkZhJtbzFDqB2ctelmb8BnkuIM9KxCNB9O6QzlM/QW2TKZIZ8uKaJ8?=
 =?us-ascii?Q?INIjYs/YmL53v1MrtygpW13Is8Vn0iovgUloBn+QUrd2uLxmfuur2ScEqdad?=
 =?us-ascii?Q?dw6f95Y+9mpEgnUFgyJA9+Fm?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CpH1N7ditlEabsWM/dkZnhJq78HN4T1ay04uGQWa5Jbt43vVOXr9gN4KMzJI?=
 =?us-ascii?Q?/GsGaLcPprqZLQrSX9qKL3kicUekaNmQr9CAzRDefFGiOXVCWHvNPmLA6RwM?=
 =?us-ascii?Q?XIVZ7t1LeExFvFhsvKU4Bl3Mt95rHv8wwuMmUfTxryAZucm6CdJ5VJ//o3Cp?=
 =?us-ascii?Q?EURy6t1dQTuqydVq1oTP6N0HA/ETm1rFoUUu0EmVAQkgTZKcLi43+8nwP770?=
 =?us-ascii?Q?TDpcNLkMX/MYgy2nLimoNXX6DlY14yw7eW23aFKBq8IDCXIiTDBZNzu5tp60?=
 =?us-ascii?Q?ElRNz9MW82qD3Bs1CsoOuT/4U2c2JnRGlN9IGKR3hdBUlqzMLi1Ryby2wCYS?=
 =?us-ascii?Q?7VdMVv+l8HzD+ex7Ohc7uBLVMU+U5JP3ig3IhxdLtNLcFjhfHVorbtWrrg/V?=
 =?us-ascii?Q?qwAxnDu1sfmsCvjwf36n35wj8vVhhFe2kLPWYpVfg7Pc96G7o5uBQaLhj7au?=
 =?us-ascii?Q?nK0wKmi4Hh9wGx7Sf4SN85P+UlO0eNUZqGDFtWCTL5X97lk4USGj0OOTaf7C?=
 =?us-ascii?Q?q0JeSI8Ae1X2Y4exRWlNSIlPuq8llEXdoKb32iwZCs+h7oUbVBH30Z/ReMd1?=
 =?us-ascii?Q?GNPKd3Vk2xpFmV0KcuJFwIZZv60U6+/j3hFnx1WgfoH9uDwfCwWipY2OPapz?=
 =?us-ascii?Q?1KLpEZAFmb/Q1tDqcChfMpjtVSCL4k7FI5rR3yACGsJgYYhBNkkNDhDDVaNO?=
 =?us-ascii?Q?ZlKvl0IxvjKC7NvKMHzkyAraVCrmiSqXWSWz3Rrc/Iz0VaS9nIKsYhOtQ6PA?=
 =?us-ascii?Q?uaC4QCgbK7QIkb/ARh5b31zTsJSN4gzNf/v/QE2zj4Re29OtT0C5eP3vJrMM?=
 =?us-ascii?Q?cWjf2CaANuqN6zJvs6ER7wzytIl81+aIunWjbYpdUIuPticvgq07J1bMl3X+?=
 =?us-ascii?Q?Xn6Nyw59vPJ6da8dW2pIE1N1A5uEe0WmxBJFxrygb2bRR8KpJEVTRKymWk+Z?=
 =?us-ascii?Q?SZ9OAYka5PRyDX4WQmSMlgBmGDI/HEvfhaud/GtyoRRCcXtktpjNg8OlV+3c?=
 =?us-ascii?Q?nSw0aH5Kozwv+AF/tbecE6oDxFSGM1PYnCKGZF6WiHI/GtACawDPidZQ6gLt?=
 =?us-ascii?Q?1ncrZ+2aZp00+7XT1hUCpYueLENrSUxpestwxiNrDnnry2WXuI8u6BfbPZZj?=
 =?us-ascii?Q?5UKm6giRB0BFwzsqdDboHrpKu+dyT3Frrq11F61otUTEf3Yp/coG6cWlVrpz?=
 =?us-ascii?Q?WCh298H0385ctiTGyoeZ72U4A5A/Lu4y7tFc3x786Z3QH+TaOn2s184VpkxR?=
 =?us-ascii?Q?qoTlVuoGo911nRaocZKxtot0YMC28x0cI+EZT9v9hG8cyrnDtkPqaeaD8oK/?=
 =?us-ascii?Q?DK5oawDadjd6/BsRXkXQtwPl+heLcJXD8aZLs+MmBSZaFpshuDBmZrA8ELXJ?=
 =?us-ascii?Q?kt00WrhVjxvF7k56qSZicbGvD2oqsy9B8ZeI8+qbPxGLLutP2id28yhF5f2l?=
 =?us-ascii?Q?4p22z3PKBlpSdDOLRKK+dNTr5HIUQ9O6LsLLcEtIjHozT1nqjBJAPFdbNk8o?=
 =?us-ascii?Q?JlMKWQmuJSN2gKpkZO6ewPJmIVkt4n3Pjv6EzY0/pcJCR/MlkRiBFFugIzJp?=
 =?us-ascii?Q?IapJbDtvT4F+WAAuq1qY+86LrR7+8PGvapj/PxaI?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	jqiOAc/AVmvOUg5QNm5pJZWSYIRwcoYVOa4A8FhBDmQFli9iidusHz466CXItg1IfnRgX5uZ9OiOtWT1RqUihIZo7GsVzAsrOdcRyPiGy1rjGGocvGrSKW7sMY+p6jE7zSzwA1s0bDN+cR0yNpWq8yLYqWSguXn7yMjBUkq0oHuBtGqtYKZn8s5oLCPicx6ZunddkidGTqjT+Kl+1K0PXL6PwpHv9lUYll/BShj407wE3yF2WLs2Ojwq3O0eiycdW6xSiZaNbU+OxHtl9/NPCUiDbMELQw3Z3/Crt6Q8kiJqKHv2+vzWMy1Sjqr6eG1/x2dMTVVfxco0rxRhrUP19pCW0LGFYWI40sQec2VZybZHLdjjfzfdcxMMpsuA+dex4Jw253YdJh0J0qYKBpt39mURJ3FdgJgh4m8tr9d3nr9NFT7Foc5fY49mr47x3zNooTYtYTcY1wo/n2618sefQNWsRJm+zdOt21O7C3PhNujMOJDTn/np+43P9al3kWptZB6zsB758Pd50QUwxlT5TG2m+kcWdaR7/DcaedL9p558dE8zy9s+9Tfr90QF/Vu+wiNTttnNyVPAzUvzCBkogPe5gen+4nSQW+Eq4iBYSI0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5928a2fa-0814-4923-f013-08dc966ae7ee
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:35:08.2968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hogMAxy4VMZIOMCmIZQh+iY6SZ4S5Ovkf1/cLh4qi5jYyhHLMSglTHJLwirZalryE8b+tLYSjF72yLtQzJ4mEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6041
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270040
X-Proofpoint-GUID: pGdeJcqSAD2bzyPxaSggS96uli8FAO6Q
X-Proofpoint-ORIG-GUID: pGdeJcqSAD2bzyPxaSggS96uli8FAO6Q

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index b712c589..afc1f628 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -337,15 +337,16 @@ static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp, int is_usdt)
 
 	/*
 	 * We need to enable the underlying probes (if not enabled yet).
-	 *
-	 * If necessary, we need to enable is-enabled probes too (if they
-	 * exist).
 	 */
 	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
 		dt_probe_t *uprp = pup->probe;
 		dt_probe_enable(dtp, uprp);
 	}
 
+	/*
+	 * If necessary, we need to enable is-enabled probes too (if they
+	 * exist).
+	 */
 	if (is_usdt) {
 		dtrace_probedesc_t pd;
 		dt_probe_t *iep;
-- 
2.18.4

