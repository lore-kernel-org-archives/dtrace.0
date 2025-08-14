Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A031627381B
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 22:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755210178; cv=fail; b=oVZO7KYQWWYmsNkajHS41R8u48SLhMFEoeF239JFOXrIrZinQThvKcLj7SmHY62Ti0sxEjUc2OLqpSEeXfyY7AO0M96YV9QkbasYWosoP/8vZ8qjpBKKQqFD8DFN0IXrOFImHP5ZQ/cPkykL94uY+pULmtpShXPOAIZ5W3gN27U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755210178; c=relaxed/simple;
	bh=OlCdMGdqnjyxTGPjxOwTGzk7ue1ZV+RI7usORoBs5mc=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Hodp5gC/Tt1+DOLBhFwpIJlasJS8jBUoNhD6mx9UghsL5Q9vashp8xwrSmnETZiWBAF5Gee6Ho2cArdeOHNnoTIeGsLiShfAu7UYHxwEzFsNVJERmcHcEeea7BgDH6EYA3LsVXEbXaKmf10VGoAAUkIwku3wPqzab4lj0p23A28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oO6raH23; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qYVkySH5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oO6raH23";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qYVkySH5"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHfqfb025405
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 22:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=Uz73wEVCyZi/LybLHXI+T0sLWaHZaLcByFREGhlAsSs=; b=
	oO6raH23MfFyDxTtaR+vHxnUoGvVBysZeZKr4EDVCDmRBVFjVQ++PAI3Ra47/Gtq
	U3uiAjThrsJHTxv1o4kP/Ynj+h9fVRx75xo5E3Lshy5SjN9XAuJ536EKA5bFvZvx
	eJAq5X85gzqSRBEdtop9FEtS5BGgfk3eMDKE9FfJd5e8v1rUt2uh8IfUTXwX2X7y
	hB/lWoqtjJYZKPlohAMWMRDrqdyv8JtmaehzW1jqd3VUBSz6wGOW+dnTej6h6Uqv
	Y2JyvTSEX9YmnGW7Pn1vBOF3C6LGokCIJFp1hKGrP7MfTekQSAsUlvYXdcT3JsI2
	WPXLTO1oJf7vvoRtahAokw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dxvx2xv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 22:22:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57EKgTID017405
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 22:22:54 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsdaakv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 22:22:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjX0UMVqx7LSe+QqGpOJkEUukms4Qa/h2GzeJgsxVb+ura9oenPeYbz9UUhA8n/aSt1igISISVzGCjsnY9IfPV8SJG9XqesiIJd2p+Zs/h+rBFGhXir/TZEs3ynsCWZKxRzZit2UgkbLZcs1Ozy+23Bmz+1Y8rs0Gb/gy0V8QZfOkcZKU0JUO9uVnXF8i42n1ncPSr3TLPYU8mGHcceNPR73V5iYW5lGwxMDDaoGUVrtQhbzemVDLmLrH+QngSwI1T5wzH6efWph01suP0qlgwdOj01h4S6p3y+yXMVlLjqPm0r7ChIiCX6v85mfz8tJWneVTzRCuiCEgaT58YDOJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uz73wEVCyZi/LybLHXI+T0sLWaHZaLcByFREGhlAsSs=;
 b=AcqQulwU3wh2ODDypGDMWY/8BJLcE1nvMKAid7noS3RdfSpSjWXvZa+M2O01HNE/B0XTvKBl7pD+Pq9tAAlvds7VTroCQEg17eXhUI3GXDVnPk/gcWRLtTEff7J4bR8MfJRxrBIJAt1ppOYkcdSzzMI6k3ckAv3K8dBYj3BDEu11pwjhR0wiYoOyxk6mWWqc/TaxH/teru+NNh65Mnu3Ji/FYY1Lgu2ou99O3+Vqxb3bRKxaMQXpA4+R2UOLnWGpYJ58iXAB5o31HFv9jT36/bcD04haytBjDCsrgl69Y7gSwcg/SyIPcqx19KbqMMipq7xOaHYX4ZsTrjwrvD8p1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uz73wEVCyZi/LybLHXI+T0sLWaHZaLcByFREGhlAsSs=;
 b=qYVkySH58nwqvJxYMo6uy5mmy/07os2oteuKStMCt8gSqiNt0W6qxeCxCkQFXZCMzLUkQmRHnYDUA8ez56faWvagp4rdfH/XOXxMrSk0YX1RY5FuURVUHEz4dfKWY/gvFfHxPkhsSuGbh0lNjiaD/Wweqgn9k7z5jLzWnl3KWtI=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by CH4PR10MB8099.namprd10.prod.outlook.com (2603:10b6:610:242::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 22:22:52 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 22:22:51 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] examples: update the comments in script fcalls.d
Date: Thu, 14 Aug 2025 18:22:48 -0400
Message-Id: <20250814222249.13445-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::32) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|CH4PR10MB8099:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b0fd992-f7c8-427c-5d37-08dddb811b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fuvKwOD7EfQn+UNhrZ25gtdYtxnCkGrsDN/UMOw2vtSEoVoenFHf1YkboVrf?=
 =?us-ascii?Q?I247lherGQ72duGAJbwYMpYh5DijSnWsUnDdW4Bg7xXFP4N9L63ig2o5pVn5?=
 =?us-ascii?Q?X08mZJmfpFWPpuJMJ56PvhdD6bz+ua317drYrO4zjAQFU67F0+DeoeSUWpql?=
 =?us-ascii?Q?zb6FlTGFokIRanE1UFqRUJe9tr42zfrnSuaRUHPrxCfafPx0Yc5kPwsN0GR7?=
 =?us-ascii?Q?eHc5ABjynflekYKlwZ3e6iTtne/nYEvFCaLZ06cJmBADPrugT3UU57kOR0Gm?=
 =?us-ascii?Q?+APNYOsmcxWB6PWhRN6iOawi9ShHHe5iator578AsfOFGje4ilICaZuHq3Zl?=
 =?us-ascii?Q?lLVTz19hX1los8X5/zjXoRB7MelKYgNsIgqa6rSfLJ8ifse/odOCgIWI1VdU?=
 =?us-ascii?Q?A0A6QdX0vOqVDi4sp3fNNEwdlMlTwVbp+E6RzJzhOfqT0cl65YXOkajkx5RL?=
 =?us-ascii?Q?UN+WjpNUCGE2OLT/rgkqnQGlsnBOAeGlmZvUgVK0g9s4sN7wSDP+rH2tUY6p?=
 =?us-ascii?Q?bed+kUM5kerqyEk9FCFow2tQpyR+kYMEmgVN1AGKgpxack4sRtG3YQ7U9DCb?=
 =?us-ascii?Q?Sem9Mt2AAIadCBKkt2tWhjY7ng+CwRaffy87JDWqv2JNe/ooMrdYwg2iCkhH?=
 =?us-ascii?Q?QIGy5r8NFhFY2dsCX8hMQhc0mkfH0HG8RI4SP8LCxki+wKVwnFp7TKQUlnAo?=
 =?us-ascii?Q?7UcTNol+xbzodwn43CfjAXGYBeYyGVFEKdCnZ3H/n824fO0NuVt4kPX5Ut6A?=
 =?us-ascii?Q?zy+IlsnvU06bzpLwLVaN8QkN0jCBvL4z9TEvfG1SgfqOp1Twz7CzegCpce2g?=
 =?us-ascii?Q?Koh63QYX/AnrZeEqCUV/1KocgRpf0DwFMKPQRclEFD5/Y3+B5z4MBlRL7zoz?=
 =?us-ascii?Q?FlBPuoJJ7m38xmTI8yUVtn9yNPrtTowxF4v+g9XOdUtGjXrSxpN9zdS2Gv88?=
 =?us-ascii?Q?foDJdRK9Y6buzmu+opsh17ZDqN5xAIYRaGXu4zDGJ0KhoxGBmcd9AN9Reius?=
 =?us-ascii?Q?hx+8o29IRKUJm4tlK574VPCvBnX+9+F1VybH6JDf4uts0E3ipoBCumg3XN9d?=
 =?us-ascii?Q?l8/JoROheSqe6A6r+DIaxjIxGp4UG60crXaIriwkaMltFXBjBmZepggJnY46?=
 =?us-ascii?Q?EuJj9VKHqbJYtLgth4Gv0a1Rwi6C5ZMrN7HPM7MtQoBax+f8I+jk9NspgaEh?=
 =?us-ascii?Q?11rFwnV/4eo20JaQ0xaXR3loXiHImPqZW6bPw6yai8EOxo2EQnufIEgfOOcP?=
 =?us-ascii?Q?4/THbKuYazsWazF8sCCjQTnVcTejmQISvcZN/80f45amBHgr2egq/M5AmP6r?=
 =?us-ascii?Q?xjPHhl9tc1oMv3CoV3d1TcVlRFQZjvTDcAHUl++QLcoocdA+8E/ZrpV3iPKs?=
 =?us-ascii?Q?S9gtW1FmOKOnTR20jirIRm6nS/TOXeYrz3/zj44MlzfudiOlBNLgTANUT/xa?=
 =?us-ascii?Q?H443tI8u45w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XgMTQ10oytxgxxyVXcpMHO4HcdAlr63uPsud5op6SPDM0kT6XRUEbcFPqWzf?=
 =?us-ascii?Q?GvlYYJGt3YGkzSHlendEuWNPmG//MdU7djM4L3bs75g1ZI/Ta+kF8DUP2haG?=
 =?us-ascii?Q?OPYh/KxndlfjdHVB+wQONOv/C5PkpWscnMLzWnJqnvp8bmfjm/piYE+UWWi2?=
 =?us-ascii?Q?HzOIn6rRrl/a5AhdUEW/tHm7BtBfKJHGmh8QKk0bE0vNna8Lsp0oqOrrNYT/?=
 =?us-ascii?Q?es72mLawW+WyAw+GFg494mk2B4YbG+qhQccSkCZyeJ5R4PpVIjzkjBzjftgB?=
 =?us-ascii?Q?iyXVuLcGevrg9Z6Zdq+7YM9GmoUmEp3nbGRMI3bpzpFHXMxUDg8tEfTnN2wP?=
 =?us-ascii?Q?70rj+7LylFKDBFYgtbYmQ2N4AsBbq7r/dJcjf9yGpvNvKT1WtM+OBcir/dV7?=
 =?us-ascii?Q?4Xrsikpz0edmNdWsIzbFRyRWK9g3JTPODfAAsz4TvjB06tXbFyU349NeWROa?=
 =?us-ascii?Q?qqLwDOgmiC8DRBBnqEOk/LxVpUEQC8ceSO9ZB57Pzm9KjdpSJis6VJdZtU+P?=
 =?us-ascii?Q?KNBPglh/nF/DCqIpWoqRQsnDhnYvmukmEuNOYQ405ZP00ocBJhdlTkTaSH17?=
 =?us-ascii?Q?LA32QJXbAhsYbnPuAcCgnc1+5fE1vSKtI2KErtVD47ycYqdHzFIqy6IxuFoB?=
 =?us-ascii?Q?Uq46hQai9Ag4KGipZOC2BsPGxLFn8+FSVbicGgHEoiyx6uK/HlfKgUTctLK2?=
 =?us-ascii?Q?SyjLgQxs4ULQEAZ1Nnn0ix1KuzDVrkM65wqfhkVhAr6T+DoopHaYAJDUBrxF?=
 =?us-ascii?Q?c6ep7oBOwC/9Em2NMM7/3rPPIEsnzYil0XyvWamrZldoPtYro6rDdbNCBPkv?=
 =?us-ascii?Q?aschHI+ncTUsf9PQF4PzbG407zFSObvKnm9t+c2TmgHoc19xPy3VisS4ZyBb?=
 =?us-ascii?Q?yhWCjrCTSZAq+YyjOSc+SLKfbh+QesfdrIQaQOX2Uf3+KmeflAe+xkS9eJa/?=
 =?us-ascii?Q?RWJM4Rb9VW39xHzxsg1BsjQp3OcqQQiB5XhJf6+S8j34O5ongc854Y97ugYp?=
 =?us-ascii?Q?AlBSM2oZaP9qYJS/8xxMIDoDDteW1TrqLUpzSZtMBxRX8/DPFZier5dAJc1W?=
 =?us-ascii?Q?Esb+/tP6cR3lkTpRajrG5aooYmmayr0NcLLeIwjnJ3caE9qeF3bnBmvryPaK?=
 =?us-ascii?Q?Q9cZCexGO0ty/aKcn1EHP3coU+JiUJIjRtI9ZJaH1zSlOuc12GfsIMkb75pa?=
 =?us-ascii?Q?k51IwqHJ4DIB8Iu7URvsBV39tjOH//abF8is/gBy36XSV4h+J95ha6C8SDgY?=
 =?us-ascii?Q?y33p3snK9blbBorAdiXKrnc1x7cXmn8Mn3ZBiHLz9mjBf4BJU9V/A0Rse0/B?=
 =?us-ascii?Q?Wvx4Tba6kI4LMCfnYKuzVsa5ohDgdHC0n9hiyyhSREUD0gAqpmBDMYvDOf4g?=
 =?us-ascii?Q?KVlU8XBVPOYazqK/aLpPkf4WkBH9bIByvaxZ0zJsYKM7iQm5cIdJTEZu3yfZ?=
 =?us-ascii?Q?t3P6QwQJghjwJNUOP2x+Z/1RR1kemVRymiNjAia1WyofGAHCFtZb+BkYFEdH?=
 =?us-ascii?Q?1cG0jFEJRQ2v5yGFL4zwemeO1Yg6xpS5BTOrfOWbKAE+0tVxpPDfB656/AJC?=
 =?us-ascii?Q?FpduMDH8kw+bx+TgP0Ye8DK7yNvJmXKT+VehCDYS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uQef+pibXij7HH4DonMn68RLEQgUP6KeRL8T4j1nDYx3hnNDW/t9UUPOMKU0G6izJFo6EaQSpOSoYUg2Q6cdsKtyQ+sCXPrk0cDjqMcYddKC1vChEUcIQ8Bo6KtJjPjsfJL7YDeHa8/iW4rBQULoj+fulgssln66O9F9JDRXWMWsE6UiumE6udNQuIKIdFk4rUYu1k9n9v6n6RtK1rsDukYTADcPVKKpKlM9i52r7TfnmQIwmT6S3phq4r2Kh8SL76H8JLEVLrKklJBvDdXMe8Z8jpC7UWlLWzslggzsJJSD79xjTBs95zj9Tqc1xo6G1UmbuKpeXU01xW4AxBGuls8kf9ZbikkEvqB5Q6WzQBdZqPE86iXYkkvBAedUG4TE5rdXJtufVhpFurDkbqalDY37H8u8bCjrY22553cuLlAIf5QpWWXQXzTKqATzVPw/9P4cN1YYteB8Mb8OQcYOIG85v/lNWQZT/IvVT/LDR+oA1DM2y9r0V27m+uYlniJNEpU0DabojegzwWMBzUx7yFnwU+7GW3PkFl49vxDitRuhXpoDO2xlfI3/24LO7Jh6MrLcokKbhObq+nQ/3KZNFmCrFRXVN1+OYJorQRMtj9A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0fd992-f7c8-427c-5d37-08dddb811b8f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 22:22:51.8699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wqmyVEbAMdWl1zCItEmHwvsOxRfVvwgTi4EdEQqEj9ysXGKjB+it2zgnsKSvoue++GiQhXthVJbXehGZw+0HHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8099
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-14_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508140191
X-Proofpoint-GUID: cuO__xJVhhIJQ8MVr9vftTgHeqFcFyqx
X-Proofpoint-ORIG-GUID: cuO__xJVhhIJQ8MVr9vftTgHeqFcFyqx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDE5MiBTYWx0ZWRfX70ky9doUjf9K
 hI7TDBmmw6sy+l+8E/dU08jNKHMiOtkM6HAa0fQAJtac0Z2/U3Z7ai6SKjM3zG3WxO6H5ybyJO5
 AbgTiLFw47vWku3q79IfLhGhf1XJ67EP8M4YoGpH30ik+4ni3UNFRdi17yq1SBqRLxvSGC8MoGX
 KpACTaOldV2xl1SJFwsQFcJdfBFjXRXdcTCm3hvN8/oMMGJIcn2tWGy4sOTDLKsf/2iWYAVqKbB
 SQakPgLmSeU/C4OzeQdFLR0Xb7g9Sgj93efFflL/CFPY3EPITxUQsenjaY35Edqm+BQt2CuQmhi
 Rqtm6nWRROYuKRESDA5lA9VtnVyvqXXopEoMW0TtLF9OnlxTqgHrLPZls7nLbKTtLiblCeDQIIM
 CHFxc2F9gBue9rijkx/LYyAVzJE/vDorkv18Tdk29XyfwIz8jeTDEPQc33vkMpW7qJF2e8Fy
X-Authority-Analysis: v=2.4 cv=dpnbC0g4 c=1 sm=1 tr=0 ts=689e61bf b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=MPEktsaWi-QnFnfnupUA:9

From: Ruud van der Pas <ruud.vanderpas@oracle.com>

dtrace/ChangeLog
2025-08-14  Ruud van der Pas  <ruud.vanderpas@oracle.com>

	* examples/fcalls.d: Modified several comments.

Signed-off-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
---
 examples/fcalls.d | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/examples/fcalls.d b/examples/fcalls.d
index 9e42f0041..c332dce40 100755
--- a/examples/fcalls.d
+++ b/examples/fcalls.d
@@ -8,7 +8,7 @@
  *    sudo ./fcalls.d -c "<name-of-application> [app options]"
  *
  *  DESCRIPTION
- *    This program lists the functions executed by the target
+ *    This script lists the functions executed by the target
  *    application.  In addition to this, the number of calls to
  *    each function is printed.  This information is given on a
  *    per-thread basis, as well as aggregated over all threads.
@@ -19,12 +19,14 @@
  *    duplicate the probe definitions and in the copied lines
  *    replace a.out by libc.so.
  *    For example:
- *    pid$target:a.out::entry,pid$target:libc.so::entry
- *      { ... }
+ *      pid$target:a.out::entry,
+ *      pid$target:libc.so::entry
+ *        { <clauses> }
+ *
  *    - It is assumed that a function called main is executed.
  *    If this is not the case, this is not a critical error.
  *    The first probe is used to capture the name of the executable,
- *    but this is not critical.  The probe and printf statement
+ *    but this is not essential.  The probe and printf statement
  *    can safely be removed, or replaced by a suitable alternative.
  */
 
@@ -45,9 +47,10 @@ pid$target:a.out:main:entry
 {
   executable_name = execname;
 }
+
 /*
  *  Use 4 aggregations to store the total number of function
- *  calls, the counts per function and per thread, both 
+ *  calls, the counts per function and per thread, both
  *  seperately and differentiated by thread and function.
  */
 pid$target:a.out::entry
@@ -57,6 +60,7 @@ pid$target:a.out::entry
   @call_counts_per_thr[tid]                   = count();
   @counts_per_thr_and_function[tid,probefunc] = count();
 }
+
 /*
  *  Print the results.  Use format strings to create a
  *  table lay-out.
-- 
2.47.3

