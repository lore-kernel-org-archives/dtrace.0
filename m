Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9F317B439
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731646583; cv=fail; b=tLm/XGF+PTPLVVS1p0j70raa9T4FyjfwrbcPyvAWL0zTwRsiUsaNaIO7E9imAFdYmT9UHjhdLl7lrZODKFDhP1MgtsmNsE7jgG/B6ltf/Luz52Qq1IRIdYJIC2d7WKaD5nY27bjrBmbRo6bBX0E80s7Yi75FXeAPCMZm3YSZWaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731646583; c=relaxed/simple;
	bh=qxMFfoDwrww41ZjX0z1iYZ0QMqxPSrQsLNKghorSeWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VtcyP88NHHDUh/A8cnf2ocia75deMlieqW+EAW2whttXyzDc53zj9cQnskhy+2vZrm2rqpNf/nb64US16O7OBJAqxD7CziM66N+n7zIYYAhRoR8F5ToS3Gf8Kehf66JBRkT9aCdCdigt9WO4tr9GhIw29r2MhZl2TLXdEkv1zU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cEwqnxgy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ITqw2QnW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cEwqnxgy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ITqw2QnW"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF4Bv1a025417
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=mZdvMgNQ6RDBztR+2s
	YPkaA7pcQNBE6RmKE9xnfXMpo=; b=cEwqnxgyZvwi/NjJaqKabKwt3V9vTwWgKW
	4m/FuwJGeHRMkZ8POQMSnSXzdffgE/Hsv8RYaNA18f8OCEvJX7H9rE8iutxijBwT
	XJc1XNvxBV4NYxj22ymPM2vOPDFgseopOePwB9HfsjaM08zIaIHXOk/mHoecrq0f
	vI6l4Ylsg5mKer2G9UVXmih1c1Ow5CwGsmcLweR1bnCDPaN91fzVNHKWF2xAE/Dx
	WBafqaulqu9aopeVMm4cWb/fAp8YjJIe69xTlOo/YAy77p54KbMHxeHZPy9O3Fkc
	RnVEunZ1l7zoXuXDoOV2FdSLfbzIzZ0V9azyYua4sjJAe2gsfIog==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0mbjsbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:56:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF40Ghq001241
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:56:18 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6c3xwp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:56:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LnJ3M+ptoGj0w2KJyV3r1HWK5/SBOMyr8x/qQ5ECa7tRkosE2jCqOfxAoJSVVmrVRG1BMJu+WfVHQ3ivuhZKFUdD01Pvh8vljJkGxDdwSzOXXdi/euCrEVVQ1gwtBfLNhQToo1iARzygG6YAWv7PS4ns8f3pXVT1ztRxGyH2FwJDH1Ftl7LC5J1YAX3oYFPiMlGfJT71CqOjTTFvoEFFWUBX82rtNIBs2edGBoHtlZHkEJemtVhGRQd86gkW9qVdJhYn9sMWonBrTDlksdPU4SXnSZAnKwBJRtjuNDkaj/a1QxMEsOom4f4BHQTwI6dBlpDOt7YR6qYeOLPecMteJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZdvMgNQ6RDBztR+2sYPkaA7pcQNBE6RmKE9xnfXMpo=;
 b=vzPMw5GgGj4cqzR1l1l1fFNpzREzYOlR3wFrFy+ya8jcG+ceQKw5hUBaMESU14RC7NY2LSJpBeYjd29SR2vjVUBQ4lbjMcMrBJNn82zPdLCsh5uu0k8nyXPIyxgoRdzARIQ07oIe7EfAcI23RLbkywUpDHf1aS29VbAFLPPUNCeNpbQdj1YLfgieBtSe2wvwmAEQ2bp58mx2ERPX2w4fD0jFw52prTtMZtMhLWQdcNvnNwvLb3SrbZ+ZDCg6cHaCEiVZjDioF2LXsx3Q5zjg3O4VOXzT2BvJuS8j13X6nFLxIUlePSkPeJ7i8tZYLoZUU5AID6uIWtPOzxrd6EizDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZdvMgNQ6RDBztR+2sYPkaA7pcQNBE6RmKE9xnfXMpo=;
 b=ITqw2QnWSHMPvhuSpAP0TY8p7vPfufXHsBhLRDSxCN7dAa5m1AyfVr11EpKVn64wq/x/Mzo39L+yGExN8jaZJ2NqrvmmCef0jRZUwiNrjOB4CM2PHqVbnW2WNsu1YmlI9PEn/FXrlkiIV+oNsiLXfko0CF52rXw5Qfyv90eHy3U=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by SJ0PR10MB4461.namprd10.prod.outlook.com (2603:10b6:a03:2d8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Fri, 15 Nov
 2024 04:56:13 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8137.027; Fri, 15 Nov 2024
 04:56:13 +0000
Date: Thu, 14 Nov 2024 23:56:10 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, eugene.loh@oracle.com
Subject: Re: [PATCH v2 4/4] probe: make it possible to destroy probes in more
 cases
Message-ID: <ZzbUalCqoBgmUzPr@oracle.com>
References: <20241114220108.95647-1-nick.alcock@oracle.com>
 <20241114220108.95647-4-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114220108.95647-4-nick.alcock@oracle.com>
X-ClientProxiedBy: BL1PR13CA0435.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::20) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|SJ0PR10MB4461:EE_
X-MS-Office365-Filtering-Correlation-Id: e2d55193-85bf-4074-ed74-08dd0531d49d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uTYUXGDIB91hohjt/2uwrd/ELuLIr9hH0lwzOw+uwtD8N9IocV1JcMtO5Oo9?=
 =?us-ascii?Q?JChJGJxOd1hGT5Awj+GOuZfk+ug8/Th2OQtnrtIL5eRopuL/l1G9BSsi8TN7?=
 =?us-ascii?Q?pMuVni4YLnYDD01nG3UenM2pZV27SzQJak/PqofNjCO6GnHRLzi372FTcdj0?=
 =?us-ascii?Q?88cCjkR1AgyAvvlAH68AVhJ1OxmG94io1GHVbOhUtZxHXNXekIhIn0BtL7cx?=
 =?us-ascii?Q?A3QRkn23Awbh/OfposJ7CC22h3UqJlrfJWxNJimxBRpdo2qCnpT8a+ajYcsC?=
 =?us-ascii?Q?ewoHn2rYPpdazf+XrU/QhOeUG53DQBX0rEYQk6uRK3Ad/EAM+bv/oCJuVEYD?=
 =?us-ascii?Q?r1Gb6NJt9JOspVczQ3RUTh+xssu8bkywVkeopEyvf7394N58rbU7iigqWiFl?=
 =?us-ascii?Q?wviaGkpbTNLM3wkdaj2WljMcbfPn0BVFiRsage5NPqlkHkKoNmDnEarurnvd?=
 =?us-ascii?Q?17me7R7hvZaiSAKcpCP2wy8IeRCMdfQPboH7FeMRk9ikCy7gb/thAVj1fMVi?=
 =?us-ascii?Q?YPcAkGqI6U0NWgQijNIw0yyaCgm6iA3uS/WKCGN270RUy7pa8ZyhqAXBzMnI?=
 =?us-ascii?Q?Nhk6OXJ864UTYVG75o1wfWcVStZrmMRoqi4h3jNPr/riHRvUlvgdm79UZMYw?=
 =?us-ascii?Q?QF6hJAUlNfNgRune11lMYalTdNRBmwh6tJrQxkkJ9wl3bekpGvXBQVWjyfRk?=
 =?us-ascii?Q?7tfikWWkHa8moWCxOF5eeKqGu4AuOM7vxraCEf4vOlA22stli2N+SZJZsUD1?=
 =?us-ascii?Q?JoW4kVs4f0uTWQwtG/baMvoCYXgLB4g20PoOK8Aa3cKn+fE9uBhg5BU6QOlB?=
 =?us-ascii?Q?gBO3xj3Y80LZRXEovkKLiPncfCUhnXUvd2LB9vbz7YrmBuFO7GvHY+OQ3Lmp?=
 =?us-ascii?Q?e0zItYaL1lm6bmE1PM4uJd78uDJ+qMWQiHwIiUnvT+xHwPmsRbaK6LDXU11B?=
 =?us-ascii?Q?3MgEJPy2S03kY8tUQeue0hhVSrXx9oyziAvqNV1byppnmjSc9zkffR688mXI?=
 =?us-ascii?Q?wikPxNESjU/UoqD0gEMmW1piPIQUe56vGbpzWXUps3N7DCQm+Mpsq60hk5jl?=
 =?us-ascii?Q?uch2kNxAko+tEsHnKvdimjprUOydNMz7qyXzEPjjm2kZX9zUjvLjei9ZWhAR?=
 =?us-ascii?Q?SCFrw4DhjzgzkdkcnoFOP9QkT6r+DKacmBissrM6AiSpiM7jzoGuDXYIpy3z?=
 =?us-ascii?Q?JrwNoiTOgRoqreBMYeRNWTdbcFKi96JodehptX3xtIhgsNMPJMEiysY6j1NF?=
 =?us-ascii?Q?sKNwqjF+m4sQodmUFwHvMWAJ/k9KUbmADu16jaoQfW1tlqwXY6PTunK6lkS3?=
 =?us-ascii?Q?X7UEgucRY0ljMfwCKzSqRSr9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7hv8q/d4xGg+qPkZFMhyvghZ26SdV46/17Cs8iS/r36DEgJzUJkGUoKwH+gc?=
 =?us-ascii?Q?WoMIwXOw8uIxIa9Ds2gCMEEnXZr8LVXx7n1+XFWDRWP1iNc8oJfouxbdqYHp?=
 =?us-ascii?Q?/uwnTAZ7Zi/4xFD09qOZo/vJ4b2bfuJEJ1FD+Yw3wVm8DbkGgWaLSQLvBzAM?=
 =?us-ascii?Q?1+VTu7Hl1va0XHHoNe1/BaLX5cBUoWb+kBmStdZFAlTocTz+bOLmNTox1DFJ?=
 =?us-ascii?Q?PsupMhwMuNXIkO67Wu98L5tLzLlZeOW2mRJ98K6KvtmwebfNkl+P9XO3V57s?=
 =?us-ascii?Q?L4bTHywCdLUVrjSr0uljIPxkfmGZ5tw5beMCi9PLrJ20efrc2KlEu0arB9yv?=
 =?us-ascii?Q?H/z84ShA31sv4Tea9CYdSnlwC4EfxrvSU+4vlkh43JlLX9hJgX08I2nFRil6?=
 =?us-ascii?Q?3lyDYhIVQt7DWHrsXIPDjD8xF+DMnRaE+HBHn3XRizNmODeAk5tS5fHdjohc?=
 =?us-ascii?Q?SLMIZb+0Qml5+FUrSPwofVHlKLQhyCWzqTEuHuDJ6l0AAMfv/LV43zQZtFS7?=
 =?us-ascii?Q?WjDCw0Zekp9e2ea2x3fje/lSPgHRgX7x5Bjim10MIYwz63PshORFlPqv8kLV?=
 =?us-ascii?Q?U7xPP2o2yFj9Oci9e+1QjSUBaGOKOuvgKo+OmY2rzm5tbI5+DhQs4SI7PNBY?=
 =?us-ascii?Q?04YMsXjCVZfhH875rTwicQEZIJab0BmfcKf9hT+wWfqemD0fQbj8lk+HD0V0?=
 =?us-ascii?Q?kKM+OT/lO/iSdznedyY82yt6eHLxEXsLZCCf8v147NPpEK2qo9XxyTVg246B?=
 =?us-ascii?Q?Yk+jf6ni7pLjZmInjHc3OqgVf8QLv8tVujq4i7QlVrHiSwa5szoQHMVRGuDi?=
 =?us-ascii?Q?EiZDNLSgYTV9uhg/DBbfpy+0Fc6sR/t9M6go71zEL/JuchNdfZVoAejONzOa?=
 =?us-ascii?Q?x/ppYBckmr7jYvNpNB+7A15KEEry92P9YrsMSJaBSvVyP5R0123UmJ5geHLO?=
 =?us-ascii?Q?p1EzafBtQthNIDxbOngFIn9aURfxS6LhmPkQCY2BvRokycs6sRlWfFcScVMQ?=
 =?us-ascii?Q?qu3wz2nnjrkb53Cg87S56uBh4D5fY6jqowdmdpLuLWm3iclgcyHFLtLh95nY?=
 =?us-ascii?Q?BEwK8HW/3BxY5SaZNYsF5AkVcZCGrRNCc7/mGb/ZqFUcE8pSD1ypi0Zo6VM4?=
 =?us-ascii?Q?MlsZmSNgUs4R6opdUEhCs7afhKOXqEvXI0eTJTtIOMqvt6tRVDVaHd2zw0ds?=
 =?us-ascii?Q?YCdEAN90F4nCtoHC/45cYmGBohBBNGvAioOMExIepuGsZnT6tzGgqK+JxTXQ?=
 =?us-ascii?Q?lq0npjl6d7L9YYyCc9MarVYHUWZBXR+GcPv+p5O+7ehaZnKDh14OA/137kNG?=
 =?us-ascii?Q?tKI9Td8Io9wi39UJTh4nWQk5yCouWrFF0fO2JaVUUpETyOK0+6+WesihWDwM?=
 =?us-ascii?Q?57w1GmyJ4UBcHWWVsII8R0RcspKeQlrcFds+Ur5ehWgOkE8nQF9hf+mY7lAT?=
 =?us-ascii?Q?Mgfvb2+ththutnKua0bGxY7eN8/OdmWDR1H6a1DtGdHTrkxtmBiD49J2isTc?=
 =?us-ascii?Q?oclwQz8f1xn7TVrl9i5o3tJedNbr4raHfLbPm7+ayOMzodTCLLa4Sptd3bRY?=
 =?us-ascii?Q?pblAs8RBp78EzXfZPu/N+DrK6NNT8i6V2km26N2/+dHcGl2iS26V9NzjQQNY?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9/e6dsFmSWOdPkPhSTQ9XBm5nD6MLIwlfXVMLOBD7B6ZjzG3SIIdBdbPbqHqqw2AFDDIwvHagUYxVEEiVLxcz+Rdj38oGCBCY9iUS9Rm10bYihN0b0A3wDSaZI/0OVabYj8ple57myFd61GBCoUJHteS0UMpATH+x8o6FMPxUSZpEF7hUb40BgjKVVu6ymLAB701u4Y+LCpwXVu9X4Yh5rL7zxelmsadgGhzOeixZtOvqFmH+yPDXj+FnfW5FQM8ccpQH9HnKkZa7QKXFZnenpVjOlI3HCD9MrW9GUp/f72KfgFBSyNdAa5FK1wEZckfm3NmqukqJzJCSf83HZ26ccve1ovRVVBZBFDYJe6agJFJ4BsR7DElcqiI7WkdvjbVMXXFj9y8EeIJlxd9eNaJD6++aohYJJiDSxYMSYsdCX6WadMkE1d0MhxXpXavID88L2iE8el1c+epkQf9GWORU7ti381J5jXlY75/6B5CD49n/aYFwElNbHvCp9g9eKCu1VRi8ugM5GTsPWzuv3ewVfe66hiRXPTUucuTPaa+oZx9TR+ehuHCWlI0TlYGW8GeR7wLOk9ZzjAMvQ7gqzhcHV/3bhfo0gxgm0AwENK05Ik=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d55193-85bf-4074-ed74-08dd0531d49d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 04:56:13.6699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOFbdve7ty/5MyxBjRFqc8/sSu4AeymtSxMVeToJ3Q62DhBzkv7vmieuGESBvbYpJQRlolOnE5Emr5h/0sa6GqtMQm8fpkY2LNGBetFSC9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4461
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411150039
X-Proofpoint-GUID: pX-vFy3rZR5S5b6ZI3XHgKReD51tZgH5
X-Proofpoint-ORIG-GUID: pX-vFy3rZR5S5b6ZI3XHgKReD51tZgH5

This patch is not needed.  I do not see any failures related to the changes
in this patch and the test case passes even without these code changes as
far as I can see.

The test case has been added to the 3/4 patch, and has been converted to a 
simple .d file (and .r for test verification).  No need to use a shell script
in this case.

On Thu, Nov 14, 2024 at 10:01:08PM +0000, Nick Alcock wrote:
> In particular, when the parser has failed (so we have no yypcb)
> but we have successfully defined some interface-only probes but
> not yet cooked them (so we have no provimpl), we can find that
> *both* our sources for a dtp in dt_probe_destroy are unavailable.
> 
> Make one available in the dt_probe_t as well.
> 
> The test in this commit provides a .d like this:
> 
> provider prova { probe entrya(); };
> provider provb { probe entryb(); probe entryc(int, char *) : (char *, int); };
> 
> prova is defined but not cooked because parsing failed in provb, so we get
> this crash when trying to do final cleanup of prova, long after the parser is
> gone:
> 
> 1  0x00007ffff7cf408a in dt_iddtor_probe (idp=0x3cee000) at libdtrace/dt_ident.c:542
> 2  0x00007ffff7cf4d5a in dt_ident_destroy (idp=0x3cee000) at libdtrace/dt_ident.c:964
> 3  0x00007ffff7d0c226 in dt_node_free (dnp=0x21e05b0) at libdtrace/dt_parser.c:571
> 4  0x00007ffff7d17748 in dt_node_list_free (pnp=0x3cee1b8) at libdtrace/dt_parser.c:4851
> 5  0x00007ffff7d0c460 in dt_node_free (dnp=0x3cee180) at libdtrace/dt_parser.c:643
> 6  0x00007ffff7d177ab in dt_node_link_free (pnp=0x3cee278) at libdtrace/dt_parser.c:4865
> 7  0x00007ffff7d3df8b in dt_provider_del_prov (head=0x0, pvp=0x3cee1f0) at libdtrace/dt_provider.c:74
> 8  0x00007ffff7cf1d32 in dt_htab_destroy (dtp=0x53eb20, htab=0x187a8a0) at libdtrace/dt_htab.c:108
> 9  0x00007ffff7d0842e in dtrace_close (dtp=0x53eb20) at libdtrace/dt_open.c:1306
> 10 0x0000000000403f8e in dfatal (fmt=0x4d6a45 "failed to compile script %s") at cmd/dtrace.c:194
> 11 0x0000000000404b9b in compile_file (dcp=0x536990) at cmd/dtrace.c:480
> 12 0x00000000004073c9 in main (argc=8, argv=0x7fffffffe788) at cmd/dtrace.c:1351
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  libdtrace/dt_probe.c                          | 14 +++-----
>  libdtrace/dt_probe.h                          |  1 +
>  .../unittest/usdt/err.argmap-name-required.sh | 34 +++++++++++++++++++
>  3 files changed, 40 insertions(+), 9 deletions(-)
>  create mode 100755 test/unittest/usdt/err.argmap-name-required.sh
> 
> diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
> index ccaa3081c5b23..31c78d6d987e1 100644
> --- a/libdtrace/dt_probe.c
> +++ b/libdtrace/dt_probe.c
> @@ -140,8 +140,7 @@ alloc_arg_nodes(dtrace_hdl_t *dtp, dt_provider_t *pvp, int argc)
>  static void
>  dt_probe_alloc_args(dt_probe_t *prp, int nargc, int xargc)
>  {
> -	dt_provider_t	*pvp = prp->prov;
> -	dtrace_hdl_t	*dtp = pvp->pv_hdl;
> +	dtrace_hdl_t	*dtp = prp->dtp;
>  	dt_node_t	*nargs = NULL, *xargs = NULL;
>  	int		i;
>  
> @@ -252,6 +251,7 @@ dt_probe_create(dtrace_hdl_t *dtp, dt_ident_t *idp, int protoc,
>  	prp->pr_inst = NULL;
>  	prp->argv = dt_calloc(dtp, xargc, sizeof(dtrace_typeinfo_t));
>  	prp->argc = xargc;
> +	prp->dtp = dtp;
>  
>  	if ((prp->nargc != 0 && prp->nargv == NULL) ||
>  	    (prp->xargc != 0 && prp->xargv == NULL) ||
> @@ -323,12 +323,7 @@ dt_probe_destroy(dt_probe_t *prp)
>  	dt_probe_stmt_t		*psp, *psp_next;
>  	dt_probe_instance_t	*pip, *pip_next;
>  	dt_probe_dependent_t	*dep, *dep_next;
> -	dtrace_hdl_t		*dtp;
> -
> -	if (prp->prov != NULL)
> -		dtp = prp->prov->pv_hdl;
> -	else
> -		dtp = yypcb->pcb_hdl;
> +	dtrace_hdl_t		*dtp = prp->dtp;
>  
>  	if (prp->difo)
>  		dt_difo_free(dtp, prp->difo);
> @@ -473,7 +468,7 @@ dt_probe_define(dt_provider_t *pvp, dt_probe_t *prp, const char *fname,
>  dt_node_t *
>  dt_probe_tag(dt_probe_t *prp, uint_t argn, dt_node_t *dnp)
>  {
> -	dtrace_hdl_t *dtp = prp->prov->pv_hdl;
> +	dtrace_hdl_t *dtp = prp->dtp;
>  	dtrace_typeinfo_t dtt;
>  	size_t len;
>  	char *tag;
> @@ -557,6 +552,7 @@ dt_probe_insert(dtrace_hdl_t *dtp, dt_provider_t *prov, const char *prv,
>  	prp->prov = prov;
>  	prp->prv_data = datap;
>  	prp->argc = -1;
> +	prp->dtp = dtp;
>  
>  	dt_htab_insert(dtp->dt_byprv, prp);
>  	dt_htab_insert(dtp->dt_bymod, prp);
> diff --git a/libdtrace/dt_probe.h b/libdtrace/dt_probe.h
> index 2a78cb9ca4dae..da7a341354225 100644
> --- a/libdtrace/dt_probe.h
> +++ b/libdtrace/dt_probe.h
> @@ -55,6 +55,7 @@ typedef struct dt_probe {
>  	int argc;			/* output argument count */
>  	dt_probe_instance_t *pr_inst;	/* list of functions and offsets */
>  	dtrace_difo_t *difo;		/* BPF probe program */
> +	dtrace_hdl_t *dtp;		/* pointer to containing dtrace_hdl */
>  } dt_probe_t;
>  
>  extern dt_probe_t *dt_probe_lookup2(dt_provider_t *, const char *);
> diff --git a/test/unittest/usdt/err.argmap-name-required.sh b/test/unittest/usdt/err.argmap-name-required.sh
> new file mode 100755
> index 0000000000000..3fdefb8130ac7
> --- /dev/null
> +++ b/test/unittest/usdt/err.argmap-name-required.sh
> @@ -0,0 +1,34 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# Make sure we get the right error when mappings are defined with no
> +# argument.
> +
> +if [ $# != 1 ]; then
> +	echo expected one argument: '<'dtrace-path'>'
> +	exit 2
> +fi
> +
> +dtrace=$1
> +CC=/usr/bin/gcc
> +CFLAGS="$test_cppflags"
> +LDFLAGS="$test_ldflags"
> +
> +DIRNAME="$tmpdir/argmap-name-required.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +# We define multiple probes here to verify the absence of a potential error
> +# where parser failures when previous probes have been successfully defined
> +# causes crashes due to problems freeing still-uncooked probes.
> +
> +cat > prov.d <<EOF
> +provider prova { probe entrya(); };
> +provider provb { probe entryb(); probe entryc(int, char *) : (char *, int); };
> +EOF
> +
> +exec $dtrace $dt_flags -h -s prov.d
> -- 
> 2.46.0.278.g36e3a12567
> 
