Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DC633F6
	for <dtrace@lists.linux.dev>; Fri, 21 Mar 2025 14:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742568682; cv=fail; b=FwCFog6sZtjUmBv8YRqqg1lGtjI8sDnQFT68DWsuj4BXxi0aHvm20bZbNwC9PFlUAiMbu4ALiKK5H+0iUXzJNC/Y5ZmMj4aOGwP9vnR6l2237y55Ci3ffVYri7PcZOaNB/VkLnFH1QYXM+O/sorQHOB7l2xk8ZnTyiubwfXFxRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742568682; c=relaxed/simple;
	bh=JG9vGT66ZOU51lEoljt6md6qlqsX+SYCyyl5Q40Cg3k=;
	h=Message-ID:From:To:Date:Subject:Content-Type:MIME-Version; b=C1jGAAu6rVzZMybctxvJwpRMBmj/ohSnE7vxD39O+LtFjIAnVMlAuNU7+x4KXjHzTOtKEyuTmMC9ARnfEgIvdOiuizHDUG4oJxSRl5+djoeJuhhdw5EOgxTD8o+A3XDOln/wYN/Cvgn3W3Jkx49Z1aIG7P0LFXtyptbtELNI3QY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JU/eRO09; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cTgWEukh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JU/eRO09";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cTgWEukh"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LEBup6031728
	for <dtrace@lists.linux.dev>; Fri, 21 Mar 2025 14:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=H5P25eo3T+6a3Lo3drSoQqw23WUhVdZ/JWWO2Nett+w=; b=
	JU/eRO09KZUAzORVjYs/0/MysfVDo7nKeQDVWclwK060CMWQd33igZWXNrf2lnOp
	IZP5Ld3kbxTct/pot6dQszJoJPU1DE3FRgVqcATkYlgSzHXJgIbBjDUB07f2hmEr
	/oZHw0qyfcHzqZd/77VWqCP2HsugxfumFhf688mmh8xpAQ6U/sWGLsKp1/eohqxx
	2BTPk5AD9Vt0IE8j5mwV5aHF/nwOe7zmIFe8UKeGHujalhOwv6trwkap+B4uEEYl
	Czh6G2o4o5+wtWXG9I6/1qynmxPnJ3CFo/P2Eydnn486gF/TlF8Uh4yhNgr4cBDC
	R4MbKOSfMdMr04emu+TH4A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1ka8vu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Mar 2025 14:51:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52LDXaJT018502
	for <dtrace@lists.linux.dev>; Fri, 21 Mar 2025 14:51:19 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxdqjbf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Mar 2025 14:51:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQikrz8R+aSWGC2jVijbjq3n4lVfzypO8lWk7ZD0ndhj+5GXXep0LL9S6D6IWLphdWdlNRArPYHZYxG0NScZ+V6w9UtLIUXCPmBS7qc/5BlYmzl9QI4TmgJZhBmYzaLPl2X2OcSvflZ/qbNIwlWCA/eX6YruMKyKBYchZDqvzWOz7kylcYxPZslrG5/M515ZNp+jZMot3QrTGOMkj7VmE5EfqjlXyBOncU6yYEce5MD95ihlVuifiOh7wQjFY2dLuxHwj9XIXJY4espMOpVBb4wO0G5LAM16uG8tuKAcWxboqrrQAL/E1FY18Fz0R2ZxxIPiIPVCMBkCYas4rR8STQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5P25eo3T+6a3Lo3drSoQqw23WUhVdZ/JWWO2Nett+w=;
 b=FLqcXO04r8MbXvVeYLm+9ONyl6OZ37bcewZtQoTx4sXVbsc83ws1/TIEVS0YAaihhPjNBKWWKW4/bAxRaDI2GPtgdSis4UoIVKR6ll8gCkYC3nhS1LAPDFfmM5/dFQ3G4eFkI3GtMcnZEMvLDBgmxCcQ43GG01Ih/n8lRUdjvXoNrxh8fwRIxDAJmWCLpcqP5XU3vK5EfYhgwqDCFyZm2doeyZ9/FFWoIwJ2lIb6dSUuD4GjRL82nDWUZtsz2d1d+kaydUH5Y3RGRQN6X9VCpfkKIKgZxc0ZRr7GZNZIMHNbl+BugQOmRBeQ0qiKjD2D6aDT+B0KhUtLZWdShzWS8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5P25eo3T+6a3Lo3drSoQqw23WUhVdZ/JWWO2Nett+w=;
 b=cTgWEukhjZmwNAPy9PHqZNtbVkpwU8xCZS1PLOk7tTvImYHrZRVue+h1pS8xw/zUjPP/xgdVA5CY2RKbHeCMlRDtenElPMhI51iM1GTTvs9OFa+nGSnwYHjKfK1gkEJivKzOShR1/L+AXlnyztvINFr32RLS8XPFYwwqOppdUv4=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SA2PR10MB4732.namprd10.prod.outlook.com (2603:10b6:806:fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Fri, 21 Mar
 2025 14:51:13 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 14:51:13 +0000
Message-ID: <9aa129d930bfce0b1a060389fc886e9f.kris.van.hees@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Date: Fri, 21 Mar 2025 10:43:59 -0400
Subject: [PATCH 2/2] consume: avoid a bad prid causing a core dump
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0030.namprd22.prod.outlook.com
 (2603:10b6:208:238::35) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SA2PR10MB4732:EE_
X-MS-Office365-Filtering-Correlation-Id: 39fc56b2-7856-404a-b88d-08dd6887d399
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PkuJ23pKlo3CAsBMAF/sOOy77V92o6dNA630Fvg5GnKwg6hFOjQ6qeMQw8D8?=
 =?us-ascii?Q?pfv09x5W0FvNM/dU0gxV7l2NkE2Vu7tXztJPadM/haFSMI2qJwXnhvikawM8?=
 =?us-ascii?Q?ZWK+ysR06bKmFYH6Uq+oCJT6H6qalic7iY90lggBTSjkIfINLI+gZNnFMU+d?=
 =?us-ascii?Q?Ya1p62XBgR8oYunIWBMWCJ+ic2SDuo4K+aQpzMK6WXWxvziSqnwbA7+6UygT?=
 =?us-ascii?Q?iI3w9WjlbsdsU8hneEre1tzqJReLFp9qApkSUIPR+G3aMm7H9eOsSKWbtL1D?=
 =?us-ascii?Q?jwslMsCJQ1UisUSPTksSf2gfsjNtnrq+1HWAzEXjkL6sWStHLcyhQL6ECQTx?=
 =?us-ascii?Q?1rVj6fTVIvZNTB4eG2Y/Q8j8fRNqkwA+uTRtgQDI10TifS0bdm5OQVrPXiX6?=
 =?us-ascii?Q?issvPF3ESRo6Ci24aNCFoikZTd3fTHxouGzfTQqUifPW3iECvpeRerP+Trb/?=
 =?us-ascii?Q?7FT9oojB/9dbrLs/Mq0e0bU3o/Fs4HifcioZ6vJ8YvlWaQHlMEMgWwVDmkXd?=
 =?us-ascii?Q?k2AHcL2tVPFKvlu8jnZyxkMIzdn1k4USKxh72xcpZUpdeXScW8BuTcGe0dZz?=
 =?us-ascii?Q?rwKyQHNLVaxyZ+x0Wa3iuWhcKb9VKIT8pCAlW9wdzGxKcavI5BdXcrBC/dkf?=
 =?us-ascii?Q?lSwYIknlQQRnsxz6yQuWQRRp2i5to9QcEoYtZpW8YJrba/uIGjnBijS6yyCS?=
 =?us-ascii?Q?ndNOOW/x0PGyCNCGL3ihreQidOagc3BPE+mVwSQ7PLlqHIyGyVhDK2d64RpD?=
 =?us-ascii?Q?MpV61POF5AxPJBVe/s/iXJoFD6Une+sq81Je5sqoNqAxEjicrchZZ848ZeNq?=
 =?us-ascii?Q?YWGOu2e9FTrJtvAFyIZz1r8MV81XAshbdl4A4eS9U1Quq00gPDT16azB7ckR?=
 =?us-ascii?Q?B2phURK8NbLZnuU7X3ivvAZxpYTHdTd79uuh6HwkS1Zz/aLmwpXjhC3ji+g6?=
 =?us-ascii?Q?gSvlVXjAmfPPgoUDol+RlQKHeeph7HQ/e+Hrb1Me1Bck+bJ6dNWgHgJVhjSE?=
 =?us-ascii?Q?9CRXLvYiu1UtjBonNEoOsVnSUlr9baY2/9tl17hZx++B9HSFKDZhL3TQe2IM?=
 =?us-ascii?Q?kyiOy8bI0mCpe1xYbCevKbXe5y9fFJniILHSSNxIJfnzHIpECyIwfFWvbM9n?=
 =?us-ascii?Q?lVdFsZc1VicMuHQMGDqyCsJtcWXE0D64sNLdEG4WHG5iFrCRaXMfvvzbqBqF?=
 =?us-ascii?Q?l36k50nssjZRZ1CyCldr8IGlwgRtn/pqLbgUrxWJiZ6NnMZD0fMa7GqNhQLl?=
 =?us-ascii?Q?0I6zjv5bdmUU3LIB0kSlrFfwxA3+xBDhIZtPuWic3bwGoLFinOeBPRP+p5gV?=
 =?us-ascii?Q?JV94/DBtEcuA+84HRb2KZ9gp8rHHvLYjibEEE5EDtGr2RWmZUpUjtiDUtseA?=
 =?us-ascii?Q?LQuPigFczjZ+pWq1JLXbp8WvfWZj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DcSxzV+tFnbPdAvHcTJ0y+jnav9Jtek2iTZapPbD+mFU1RuicBWfweoMRigx?=
 =?us-ascii?Q?m8/cd8lxegP71ZVXMD0RAqVJf0xUNjcGY84arrw3dFjMyeU9C6pnCo7zzoQ6?=
 =?us-ascii?Q?+bYI/FoIeCwz62IvONnEW3DlM7KVPJlgI4zsJw8QDzpBcKsv4bKrj7x9alNT?=
 =?us-ascii?Q?1WlD6rhBCntzK/cRpsERehEgyAiUq7BVLnjVvCjAX8RfysmL8bvEbeU0nUEb?=
 =?us-ascii?Q?Qwv3wXVpCHCBWjd+rT8lKzrqRo+tZMHNAx1IRSCK3TFi5tvxQ7EnPa8S9K5j?=
 =?us-ascii?Q?i3xgcXpv0bIBj3GHcx337oS995aAas0tchC0Y3I8OkJhRNdq4sXRZ1ACLHC0?=
 =?us-ascii?Q?wiK7LkVoplsK3tAjKEaxqE9vemD6szhLPG1HKXx+jIOY5rN0YqaKMkkXpY3Q?=
 =?us-ascii?Q?eDKPI4KeaM9T2m/UuNiFAUYvs/JYVz02ljrXwyLr4SH8X8+rcaQKok4/i1w1?=
 =?us-ascii?Q?+GDo34QP8Ck0lzO4V8q5MgrykmbAJuForQsE1pYFrQ0EfW4wYTtxZM/IQ8pr?=
 =?us-ascii?Q?fffC8Jur0r3wjPrG5CJJdQctdhBxLxlAmLQX0BMUJL9bl9vmeIXf0TqSxuw/?=
 =?us-ascii?Q?6Khn2hWqP/8YEWEGHZeQi0w+XYmJKz23kj89dAjcwId5oRy23poF2ekEqPn0?=
 =?us-ascii?Q?gq0CxcwyWUTmc0A5XoXQ21LNZOuaea5KgXwNJYZ32QJ9CKQ0m42bfO9XwbvY?=
 =?us-ascii?Q?8q9qpC5K4QbfGBy0XejPWIUBtKu5y9DMgz7Q/TwJB1r9lJYmb+N0ioTIF2Ka?=
 =?us-ascii?Q?9CEBE8rNeLtsKyVypONGmbFB2gHSUI3Xwb815J1Vxxn6RH80S7INkqSCvGaD?=
 =?us-ascii?Q?9EGUVrbiPmfjx/1VRqTwZTKNn9exYaBnCqYclbc9SggYEwic86RTOhpUTR8p?=
 =?us-ascii?Q?ni4W8ovEH0Kk1SXxkEX8ogWdfUC5IhpVe3CXQnw9sW+E2yUQRcnoOfUpmUEY?=
 =?us-ascii?Q?gBp7B3yzUbeHdOPCcs5Io2SSBZPFLfBvaA/RxGd0Du5JG8Uj4HRewfiaYgmb?=
 =?us-ascii?Q?Cb5euhY24QIE7yoP7HtGnxQ84G2A4ERxqJJy88k5CMH/Ykho1CoprIHUQU/m?=
 =?us-ascii?Q?+d3U47GAWSG6U5WBFPi5FKtcfN4UzNAiarDDXc/93H56p/g6TxEINud2hQlz?=
 =?us-ascii?Q?O0bWMsRsDWDfMv8z5HxPHELbllLxSFElU4BS3IP51ZZDazSxqxTpgPwZQLaX?=
 =?us-ascii?Q?lpqW3ZmZrNOQHVM3vbXXZ+uZh/nUqhISRj2Zj0frPvnFgXSoYw1QcAtb3UX+?=
 =?us-ascii?Q?epe6t+uLI3SwWOxUsfdpmUJFL7HnkXmefjEei1DhXZ9m7Dx46SHcNahxL3E8?=
 =?us-ascii?Q?seEGu1oB2Fyi0c7lBnVuy7K7Kd81iQO18F+e0djJGL4SNtCrfjZnxpR1mC1z?=
 =?us-ascii?Q?M1PUQE96xcsj4dheemkD03MfRTETF3LjfM/eq/6fsVio6iD95Uh28OpJXRLZ?=
 =?us-ascii?Q?e1qoZlpxuQWpPkMfTuUcP4vCaTl2PKCquom5fC8mZgMfK3TMmX3p6KqV9b7E?=
 =?us-ascii?Q?I8OhsSe7Odlg+xJjcDXSxjo2ZwuMRdhKBUiQzLlbzZPI+UVLR6pVkumBZ7yA?=
 =?us-ascii?Q?KEo6Rg/QNejB8xh/1gzwtjDJ49v04tjGyIC87RjFsKV7405LyCFfwIVhS4d0?=
 =?us-ascii?Q?vX+0+vYziJIZ6RaMfEmVp+I=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GaXK/eZEICUxIGXt72RPwHkYA1i55WwE6oeNnQRxdsQoc7ElA0Hw7mnAH8DdYTNqvdnOlW/od8y6r62/WYrT/golbf489aCzD9JdWRyrtwdxSVoXdg4lUgm8egP4GKpd3gF1BabRN2D+bf62iya+wgFx8EsAr2aOIj9rH+phzXw0cLs6clFWjxcf+B88mrOh8SaL5LU+saQ/AgTedG+czs35Fb3u7ICkqFnAiajLUP9c3mPoKr3pUSZiGX+mI3F4ODJ9SUXY9pLgyiNn4xSDDSNkw6VVNT+Y3x8aUKdtbufYysWaDFOnnSMM96+CAdBAW418WBsjp8Egq/41tqB5I1RHI+AWR1pCydN92mymP1Zv6kF99gKR7Iz7Vk3R8Ywp6lRdQNGiz1wYyWPYCoOsIJWvv5e8lZwEykpmNTjeenhBsQVDNFyKIkG5kJ5pUUaoV78p+6ppF12BHE++YrKh4iU0fPvqvPoetALhP1lAsWlDIIzSBqp92jXHnmSjxdkf9kQrVCjbm7XItYdmL6jXV5cjgXYn0dBwG99iavYHYPUomgFrUnK0gfRqzEab6VfOy6mN390UIJkJAamkcFAfpFBZAwkMH5HqHkeapWjXEhE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39fc56b2-7856-404a-b88d-08dd6887d399
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 14:51:13.7266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mAwXZkRsbqQ2Zt0ZOyjF4mLCVJV2Ymz7b3+kZzoS2hoEhHhCV39tf6sxGjReig7pbpPn2mjeUyN+x6sZN7F+QUYRgd/HBAffRlkvQEZ0A6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4732
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503210108
X-Proofpoint-GUID: mvG8ddRNSX-xVCUeOontZNKhA7JC9a9j
X-Proofpoint-ORIG-GUID: mvG8ddRNSX-xVCUeOontZNKhA7JC9a9j

We were not guarding against prid being DTACE_IDNONE (0), which would
cause a core dump if it was encountered in a trace record.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_consume.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index 58a2ead9..ed52b88b 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -2191,7 +2191,7 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 	pdat->dtpda_stid = stid;
 	pdat->dtpda_data = data;
 
-	if (prid >= dtp->dt_probe_id)
+	if (prid >= dtp->dt_probe_id || prid == DTRACE_IDNONE)
 		return dt_set_errno(dtp, EDT_BADID);
 	pdat->dtpda_pdesc = (dtrace_probedesc_t *)dtp->dt_probes[prid]->desc;
 	if (dt_stid_lookup(dtp, stid, &pdat->dtpda_ddesc) != 0)
-- 
2.45.2

