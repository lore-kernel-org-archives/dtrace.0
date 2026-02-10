Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A0C2D372D
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 19:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770750419; cv=fail; b=JXq/f6XQsFJHzgJq8Y8EF4jULxnavmnwJ1BCN+7lKhv1FlprG49OZBGvNLJy9snQsGbXlbahGZ6ocEMPTfS/U00a+74ZTpQ8s1fvfwuuU2UteLuWpZcSFP81h51HtrrCUVpXUUAsica7hcu1x+cN8XkvWusVuFgamYtdRNOTlxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770750419; c=relaxed/simple;
	bh=nWenCgEcnccGoWmXU3S3sLBy3pMM4qvNmWd3m3oK85k=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=UUqE/efIzXwLK4S957HVtTbs8mRlppdZE+VpFdXdeD31W3wJnSoZ7BDC7NciFJ3FFe/SFsQJCHkG87UKSaohbedpcxpHs9BXz1kDYbV/gbxrS7/+I3j99MN5mgjGlV5Ah8WH6wM2XJ4IsdBcR8xvVwPKTUWBMXxPUj7cRQRjMvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ep3tLkpp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uz2MXjhU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ep3tLkpp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uz2MXjhU"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AIcYSj3998033
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 19:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=UifucmOraDZVQx4MiDZpfp+aPTA7x/0PGJk8d+WSzRw=; b=
	Ep3tLkpphuLLTcBVXG7ii7XeGd2vZpPg0AZY3Wfn577pI4FVtr0HzJ9TiQX0xuuh
	JTFyDc91q5TiL1e75ER2Rys1lNBqNZ1YdFe7U2XdTJQmoL+//sTkf7DOD3g55VaI
	m3oWeuVb04a359c5rKN0awZpJbPexSWGQL3poX0AmmHhN9EK/6tLrfTw/OqRvJcr
	L1j4+Iq+tc8SSNygRS+QWsJpB2pKwwTiahbq8AhRMM2SfOriSS9N2/BFp90veSyW
	iLM6Ui2N03veZcjpqtCrnbnZXqmNWrLq4dc3/qpIito/7IOJZ5cDa/vgIKwIvH0O
	bSGgAn5PS+n7T987WR/hEQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xfp4pst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 19:06:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61AI8Fdh008751
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 19:06:55 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010038.outbound.protection.outlook.com [52.101.46.38])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c8234q5my-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 19:06:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IaZiBx98Kdm2ZYD/7oRmjAR6fQt0walU0DmojWGP7mErwKwyhSSA1GP//15+GSCDgUV7FlwSa2fYwg98jzapwpltYeh7i0WQWYyichyWfQD66IGvXwxIdP+db/BMrVKLkS8WetX6jC7PFZ6rYGmm9GKfpk8DNqsev01+tINpf7F/K1q8v27LTUHhms5iMWt09cs1Iz00c4XS+9KdHW0WLC+qWJx5WKAxxU4n1KAAGebYXQgJgK/BMRBL2g4meGxJSFVwgfPb5Ongu9jRQIvbFNqrGNF8nyJtrXGKGPqFff5JAFZiMJnlDl4FQhef21/ZL3rYnnc6sCanLR0J6D6wDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UifucmOraDZVQx4MiDZpfp+aPTA7x/0PGJk8d+WSzRw=;
 b=J3Yq4b1ifA27qcAxRq/O8IIu6KNgaI5O9A73x/nTIphHJ4jpqRbQzA7ihptHf5g05W3r5ymf20TKWGRLXq+/DrgThWBzPDFAmkmO8pTgt4IFqcXEm2pp8sPQGV1gVJ0DbfRroR7cHQ32sbHmroS43R7u4RZgd8qiWCJmVA2Jl7dQmqj3um04EmvFfOxpXEQULNKYQSpyONm7xqiAesoXJI8m4Iv7i5sn2Yu5cxn3twvKXDHZQ2cnwJIJeWwv3rFvnkNE+9UKDPGfgVD1Oc7FCwN7Txp62/bqPgOvyB+wNmBuAR1TIsBnbCVVjFengaDSdr52L2ZfZ7ps580RCciPow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UifucmOraDZVQx4MiDZpfp+aPTA7x/0PGJk8d+WSzRw=;
 b=uz2MXjhU5bfrkR6ufnwpkZ4uHidQr9/5HyqQPCSp5tEvqNFTnVTCrEgn08x3guIcN2d4bZCo6xKCBYuOImmimVkziSuUcehxtbVjpv6BL5NgkWjpGNco4UC9n0PoW0yMeh47qzd24B91HFPIMQCtD71052YLi+wk44u9uGuHv24=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by DM3PPFF6B8E3753.namprd10.prod.outlook.com (2603:10b6:f:fc00::c59) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 19:06:52 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 19:06:51 +0000
Date: Tue, 10 Feb 2026 14:06:49 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v4] test: account for member name change in mm_struct
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB752259CE738E82F7D6854BA1C262A@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|DM3PPFF6B8E3753:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b74c4ec-5345-4e2c-d87c-08de68d78bf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4B+JdlMhKNBYoAF9YvK+l9GyqGKq95TTedFpu4iNAnuVj1L+MZ2xfm0aWZsu?=
 =?us-ascii?Q?LqlRHsFxpsLkuoFdiUZAPxPRI132z3e/xtpzuwQNKL7luotgnbbaCC4ucOj3?=
 =?us-ascii?Q?9d5hJddlFPh7p9u69t04YJtjhM1IDxYhy1WQyZGTB8Obuaf8Exqmjoh+aoC6?=
 =?us-ascii?Q?wNFnz9RWmiZnFkkBYf3aakiDkidMCVlCy8ZjagmKm46bj0kNOjjksxobI20d?=
 =?us-ascii?Q?3VDsHPg2Z2sCvdWPSzZhqiYf4gYtrObT5V7defTMfMngPadlYwDvR+DsfNfS?=
 =?us-ascii?Q?16+pc+E69gPDnD6Uj5gbipQcDr1F1xLOTjcvz0gxgDbXOrscfjxN/xO+gDDK?=
 =?us-ascii?Q?0g+BF6RP4E6RdLcOviqeg35tS5DUCD/V/rbAHFyM4ho3MV1ahAqWpaMZ9h5X?=
 =?us-ascii?Q?jjpJwpaAp0FTx9I16wEaXrb2yKuRrra5kcC0CXD9UvR6fTXDG1XNOkNdxDyf?=
 =?us-ascii?Q?xoefoUf5iqE6Q4AZjGNROv19RoQAwSZn55MwaeOzTD7LTEHtCtQCDgDLqb+q?=
 =?us-ascii?Q?ovk6upGXhOhbxcTDmYayFzl1w7nsa2eZy7CLKTIC/CRf87IT8J36IY4X/FWX?=
 =?us-ascii?Q?YpJH6scQ1AoLqcsSpbOPomfUkWS2XfAbaMrFB0v5kSuLf/5fKx+vcs/OiUX7?=
 =?us-ascii?Q?T2/ezwUQA7DYzLvBZ7fNhP+0D7pYc29uzFh2RaJV1Ijq+Wta8D2CNSkfqW01?=
 =?us-ascii?Q?grfTUcO2Qtvr4XZsGu7jRoeYoPHi+8sjg5G6u60ZY083I5ANcjYxIwF+bjkB?=
 =?us-ascii?Q?y5YIVsLZwWE9xUM6io0S4+zJCny2gGjRcmcTgZwMLDEOZGYqXjy5E0L5eedw?=
 =?us-ascii?Q?Bvl3EyIK68d1wgkl29Ef6uH/yBarT7m0ggqOvDyYtJtSVGeWuPa2M9qD4aKd?=
 =?us-ascii?Q?zmjdHYEhb6XYg51WbyFTr8D6QFT646HydFDZCYU3Japp/KkuT67s6ZmF3OHF?=
 =?us-ascii?Q?DEhknpdhEhw0xiy5FQnw8uUYiqj00SUDPMr9aLz34sX5IFKXkZD1wbrst2i2?=
 =?us-ascii?Q?njU4H6kbHJcDuuA1hdY5Bh9enJydWKduVw5ssZ4YObJX4t6xlCmll3DfaAiJ?=
 =?us-ascii?Q?pqU7j+9GjfdzkVMP0Ml09vlIhMEtn2CvX8eBC5Fxd3MZw+5XgDIBdTzpN544?=
 =?us-ascii?Q?QxX8tmLj3eo9S6fMIY9bbmtyPsN8s8of9CNhUT3N7rfnKMJMiJjrOm16XkI2?=
 =?us-ascii?Q?2dydfl1wX7rU0nfVc/5gY3vD67fE2AKd4L0OyQzttowWM24R8mmhdcbEHqBK?=
 =?us-ascii?Q?TLjOSFVpQMmijA8I0nXLZ8wdbEkJzBC0donXBJDqTsGwbYlSoeD0/4Eo161P?=
 =?us-ascii?Q?UZ6ih7pDj6vGfVkJ5gNt66Tee3NdOsRIKsc0pxybvgq2JIA4yOhPfmchb1EF?=
 =?us-ascii?Q?piX5Ds/n9XWnrmP4SJrQ+lkgqiZnJpyT7h4dvgcGAlFDdmVrkI086d1vrJCk?=
 =?us-ascii?Q?03gt6xidzSaIKFMKwkOv1VSs6hOoDO/1f23z5JgwClqYeGt+lZqfkrYzxPMF?=
 =?us-ascii?Q?s/q5oivFKBnn4PLE4rMAmn9/JqV+hKVmAPS6fmkbOJXs/B8/9HS12PmCkXE6?=
 =?us-ascii?Q?yHzmDnCOZpB+Wxhp+vU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tcYcUyyIU9SXDMk2jo7SGuhvGETDn7H6Ms23o1Rvf0uE3kON2dpPUOmZpXLe?=
 =?us-ascii?Q?sRqR81wU9JUzuethIYEFvHmaUa2OO2hyPws5oR663zdsoI12wJuU3R/BYEa1?=
 =?us-ascii?Q?aU1n8jECeCgeY6aai6QRFnhouIHCGmzFKfVBP5PaiudTKfuxaRsnKAg9OM5s?=
 =?us-ascii?Q?IYpZSy5vbceC/Ugmw+ioQbM2O30W0xN8ZjZyal0y8pGoeYYn/lAd7p5/NGUI?=
 =?us-ascii?Q?s4aS6i+0/M7aw1ZPJTnl2w4WUg8xVJdKao4SC9dO1+2wz3mhXYM3Oy29AP3N?=
 =?us-ascii?Q?BXBHgx/DfHEbc1uw6V3z92xbSK7BoD49I8qLsJpbB3knF8Ty6c8yp5zEA/CS?=
 =?us-ascii?Q?0ldy+NGcBafeHi2UVdjtMBTf+B8Y+NWuSux21x6mpPOlzonUZaXlSFJawl9A?=
 =?us-ascii?Q?0VQU1DLawnLeaPnbyCBJA28YAYB3AoIEInn9kbGlbmM/5ES0fhDEOVK1OWoK?=
 =?us-ascii?Q?Ay9C20/UTk3udZlC+mWKA3m70tP23c97NuruUB+Qxyu7AuW3Ma97qClHrHjt?=
 =?us-ascii?Q?SPC7bJ3/50xcfkE/KhGJV+TPtjVzb/V+xiab3Pzx47Q2Wp5ppSFty+JC8+8W?=
 =?us-ascii?Q?zZf+eSgW+vx+8sDyl+gw8l628EeRxvpXl97aykS1/QQSIop9WkcGm+8fUEwW?=
 =?us-ascii?Q?/xMA07qn4ViLXjp4r7OfozrK5qnTL+MGGkbv5fZ3fyeKHGk6SzGFcyim8h2s?=
 =?us-ascii?Q?IyS0OctoqMGM49STlP9Ll6JBnY+8F9zgRhWAW8IkFzlYQbbNMHbzAToZGIv+?=
 =?us-ascii?Q?I0fX8cfc24NwHfqVKaIUqfFiySVvwmAXmR92/SCtIi5mFHDokYIGrxOVlhQt?=
 =?us-ascii?Q?eWQKOenpj5YljEQljT0nLpr5Gr4e1c6QpiaIr2/mXuWwdPdzmcprMmn4hteS?=
 =?us-ascii?Q?EWRR96j9iZ49rpfL8AzeW/LX/WBdsgbZ0x9B5jf6sXJ59dHWWSPCvCjgwE8K?=
 =?us-ascii?Q?nbMt1l195elMXzOnqgUDWV6P4L2qEMuiOrvnLgF3egAehDpMV0db7C3axbxT?=
 =?us-ascii?Q?1W+daSzWF0DguiUiAbwjQi5MePiYh0l3hXa2ab/5aXgly29QxCxgh/n8g08g?=
 =?us-ascii?Q?dAdfLb+575R2Yzq3dFmVHpFAQnD33iX0e1u4n/0h8cAS9gxHB8LMSIM5QuD3?=
 =?us-ascii?Q?Lb8S6fFfAkqWpGiz514xZDNtS4Fr35q4RHBvAzjda0ABMgvD04WCJMBU45Z0?=
 =?us-ascii?Q?BgxnI6RaU85xC/q8IHdMcGCgsop/SWSuosCGckz4REQE9oxRKlA1/OoDal1P?=
 =?us-ascii?Q?aXE4Ae4JABEo9cyVEN4dt9YBpNLMCIW1VA1pgQERNOB4bSvXkbBhmEPjwLFL?=
 =?us-ascii?Q?DygJcu3cBtTKdTd+awzy/ifCCITk8CXIqOAW2cYVGKyR1kkAJ96sn82BGPBr?=
 =?us-ascii?Q?LrOGSbbP73QvZ6ZBj3g/QwWOYOtAa31gREcFJO8Yg78lwCXxXK9Qt64Ya6ps?=
 =?us-ascii?Q?TP/DR91/dVGJtYHSq8pq4aEzuqhr2h8sjl27vsjWxu5+2REQSvk8lciZpa8u?=
 =?us-ascii?Q?hcGFYXiaPhXA221zNcb4zqbsiU8bDWHtEHDFt3Ah9Vr3dCimuvGMmxgVYmzS?=
 =?us-ascii?Q?UOg9XC1BUc+qRB4OcsbPJm6w3ae317yVKPCWQM0njEmTScXYTgt93bdvLijN?=
 =?us-ascii?Q?805HHmsqN2+lCC+s70OlmlX00gMLZpU7FcfMqbxeKWZz+ozNm+FHRgEqj0EC?=
 =?us-ascii?Q?3U05nMg1rvJjQdrsNwNjJOTut3yNW/26f4r34ibcJNBskB2u8J0duwwODptJ?=
 =?us-ascii?Q?1O8uTHLq2g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	612DMV3iXWFjupv3RPybV6ZHuTlWwMcEwGOC3Xezz4TF8ZXtD/b+lhbVwgTiMtjqG1GQnvw/PvqVlV4XknlJb521G/x0aXfJPZjFJP7RKEXkcRhpjy8btvRscMsOXBi/FPMDcihfUSOeAKRtOm9asKENCOCc+SJtCboUvbPVI02x7wayo1OH3nt61rb0ovaamaFNQXvYrpT7Ikvx1qRnw5aj2OoK8rhOr455L60IQtXM4087ilHkfoWCOFFHYa0Z86yxVIT3sifeP9GHvg2ESdu1/tzWFKAR6rE60NZn6DO60BdTGMYG3eGYN38HOh/s3rX1/OfrAfE5CevOHSNQiFhGzZTXZ0+5FvScm6zdHFI9if61+vys7tqZ9u3vInJQMrnNX6NnOsP75Qg1ZPIMvVFm2kkCqqfR676hDxkHwZFyCVC4ZbRWELpfUtqtC5Upf+pND12ygJi8hMCD2DcCHp6erTpHCR5Vdewavja1jgUfmf4zNDWK9wGXtM1fMi/pwJkWMazPSrJX/0fqBHPjO732x7X3KGilbGo3DzjOsQCFsrsQv4IeTmuBGw1BVnoJmD54VuEIW9nrMveE1YHBrj1jA5sWg5v/PErKyb0H/Wc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b74c4ec-5345-4e2c-d87c-08de68d78bf0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 19:06:51.2321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41B/Ekkaovq5KbxNOWgJRCds7Jcv57i/Ky1XHIv5J5z0jzO5yEzDLHhu6hycFJMhhRx1BdOoIFZKBViyXrCWYhVqL161hkPxPqpkYQZD9YE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF6B8E3753
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_02,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602100159
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE1OSBTYWx0ZWRfX2sbIyf+tNR6Z
 t58LpoPlMsBkDwfSbeCCD/eZU68068GCM2XbMxQMDjsHQ3+c/IinVGdMcjtB3IXX9OFrdV/52TF
 dar8ajDyNpA+5tminhlTG56KLB2WrWwHctdQ3IG+L71TlD6omkgAJTj4ZtQ7/490T4Ehe0fiA8G
 NOvwT+oIj+tEibH/XrRpUKOHO4eEGAb/oL/rQXtoD+nndBFK/YoW2O/5IZuFd9tIkd4yUeNNkKz
 slqicViaJpm3Kr4SojEFISNAO5FO1s10IJcDOBISk885CjEvb31ULOsr/hL7lp9sr/s8hxz8GmC
 eyU6UM08aLJnLzuR0ljmj85IQTZAP+djr0I6kLf+SMwa+PeCaUV1iU7FklYeEAvfEHLOvSmVkQ7
 BmDkT6zkRoABoq2dKEEp+fEDqyYygBOX3zizAIs8ZEHwQZUuhY2ECRPyv5dF2nS+3f3mfBWaYNi
 uEiodRv71rLFy2aSnUg==
X-Proofpoint-GUID: LzzgGzdwl3scyih59TplB3snAc2lveuB
X-Authority-Analysis: v=2.4 cv=V8xwEOni c=1 sm=1 tr=0 ts=698b81cf cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=UuTJR58Xwip1wQKR3-4A:9
X-Proofpoint-ORIG-GUID: LzzgGzdwl3scyih59TplB3snAc2lveuB

The flexible array at the end of the mm_struct has changed name in newer
kernels.  Rather than depending on a particular name, we can simply get
the name of the last member (since that is there the flexible array is
always found) and try to use that.

The testsuite gains a dependency on bpftool for this test.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtrace.spec                                   |  2 +-
 .../arrays/tst.ctf-dynsized-bounds-runtime.d  | 25 -----------
 .../arrays/tst.ctf-dynsized-bounds-runtime.sh | 42 +++++++++++++++++++
 3 files changed, 43 insertions(+), 26 deletions(-)
 delete mode 100644 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
 create mode 100755 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh

diff --git a/dtrace.spec b/dtrace.spec
index d6af5a80..e0d832ac 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -115,7 +115,7 @@ Requires:     %{name}-devel = %{version}-%{release} perl gcc java
 Requires:     java-devel perl-IO-Socket-IP perl-Net-Ping xfsprogs
 Requires:     exportfs vim-minimal %{name}%{?_isa} = %{version}-%{release}
 Requires:     coreutils wireshark %{glibc32}
-Requires:     time bc nfs-utils
+Requires:     time bc nfs-utils bpftool
 Suggests:     kernel-uek-tools
 Autoreq:      0
 Group:	      Development/System
diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
deleted file mode 100644
index f3801454..00000000
--- a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION: Array accesses work for CTF-declared arrays of dynamic size
- *	      (ensuring the bounds checking is also bypassed at runtime).
- *
- * SECTION: Pointers and Arrays/Array Declarations and Storage
- */
-
-BEGIN
-{
-	i = pid - pid;			/* Non-constant 0 value. */
-	trace(curthread->mm->cpu_bitmap[i]);
-	exit(0);
-}
-
-ERROR
-{
-	exit(1);
-}
diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh
new file mode 100755
index 00000000..b95e51db
--- /dev/null
+++ b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh
@@ -0,0 +1,42 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2023, 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# ASSERTION: Array accesses work for CTF-declared arrays of dynamic size
+#            (ensuring the bounds checking is also bypassed at runtime).
+#
+# SECTION: Pointers and Arrays/Array Declarations and Storage
+
+dtrace=$1
+
+# The mm_struct 'cpu_bitmap' was renamed to 'flexible_array', so we need to
+# see which member name the current kernel uses.  Since it is always the last
+# member of mm_struct, we just use that member name, and hope for the best.
+# If mm_struct ever gets changed to not have a flexible array at its end, this
+# test will need a new structure to work with.
+
+# Determine the member name we should use.
+member=`bpftool btf dump id 1 | \
+		awk '/^\[[0-9]+\] STRUCT \047mm_struct\047/ { in_mm = 1; next; }
+		     /^\t/ && in_mm { fld = $1; gsub(/\047/, "", fld); next }
+		     /^\[[0-9]+\] [_A-Z]+ \047/ && in_mm { print fld; exit; }'`
+
+
+# Try to access the flexible array.
+$dtrace $dt_flags -qn "
+BEGIN
+{
+	i = pid - pid;			/* non-constant 0 value */
+	v = curthread->mm->$member[i];
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}"
+
+echo $?
-- 
2.51.0

