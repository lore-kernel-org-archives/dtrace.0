Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DA31C2BD
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 05:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722576040; cv=fail; b=ZZ6uLvH5r8pxhF8svs0FGmkyUIVFESnLsw0qtvxiKAMTmLFwMJjVtGjlRv0f9aJFXVhba1eTDpmOxTYuVMa1aXBtnE4k5x9IuTjrLZUnWnhDLP8S16g0og8VOqpnNY9dEI3xXJh0fE6Ok8Tm7dOC+n/uohnpFb4kU/+NjAfzkSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722576040; c=relaxed/simple;
	bh=q5TbZdwtzhzCTzzOZYRPVSXHtRvL8nAGxLZF8ic1o/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KFcS3aZpA4gk5pLhcBVj1WqvSC12Lo53Ud30hkRldzUPuKIp+f0jX5LTacPCjrF7Np3/axw/e/gqiiQf1A64bRPBK7i9mFHnyV2iHj2kd45OquhmwKPbD9toqkkN9GLQJwvtZprbJv45NTK2TutxnTbZXE69E/rcAlnRVhlaiDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HWsF584Q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Tnod5Rd8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HWsF584Q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Tnod5Rd8"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4723fYuv001788
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=Qro9B+4Z9R7TSSB
	/++OWfNPTZgns8vEXVVJoLjuFYjI=; b=HWsF584QNoeZ0RfykUc4KAds1WNa/y6
	GIPMz/VhY/QHHRrjVJBLU4X3yXAH11cpquIDYBn3HkFPXO8MzHIGvy4EN8oM1REe
	u/CBKPMC0Ua0fkvGKYsYZyTlB9PyMFc0yMYlUJWrsZPVF3mHD4tw0NZ08jKC/lOq
	YI2uKqzUqP6Jwz8t03ELa9X666egPbn/obykiHfeXmEMF5dGa8FO5hmYK9VsOS5h
	0Xd3dYqrP4xgVSSlEKa5AIifG9wOKM02StHRvwiqoCo8/jsBj3b/1pqR8DbPqJPN
	4X6OAoFsva5kfUuAY6ulBJV/5A2tO/U2FJ7yhGUtShgvPecUYXC9+uQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rjdwgdd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:20:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4723kh8m031488
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:20:36 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qmptx1fr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:20:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHB39ycWBMRRLNh+uK/wbD3H0qlSKOqK/owhP1Pu0N/DZaTQcmS3lDwHq2FvSizlWzIh4MCZeKwsR3smIcPGRnR9egSWt7XNvhfaaCLMfpGiantlDsBtNQV1PMClx0TfsLmrgVYKFjQ+NJDZbFxl+6nviLE9IJLc5iBCsw4+DaiqynDTJhMhAlwsyFiwrovWc4r3E6v5plE/eoavYdJMKJib9cU1C85txDxOjPpcDwGMGbtHDyIf7DvvdyKGczAn+H+GFKyQp16GHeJpf9F6i0FX0YjcCEVbJ0kVBtCIUnuDOISpuD6NEpZ0tbuJwFj0uUV+z9kMO1PsMAG/0Kl2ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qro9B+4Z9R7TSSB/++OWfNPTZgns8vEXVVJoLjuFYjI=;
 b=j8fXtxYrv+osWng5l3iDt5MhbGgKMRG08alkkT8Oo3paRtnTx/Jq4D5DZ3XegjAv2k6r82JPdb1E5RwtIUDiihNWQropTygv6suaxvn9AoHLA7j36VmHyQN7OsAe+0dgkri96xRB8LLaVmI5h1RtXixGyT9MMzZX/z4xgSaXtKEW51F41xkrxdZGgFojG8PgNxOPZPfAJGS6ed/+0V3U0cwYIudNBzQ40vc3Yi0vGBRMpPu6JjYbQq1PHOJ7pjzDLnlinXakzLk0KT0ZtgXmJEPK5SZGzWgHpMpRMOj3JYsxiFnMPGMuMO/a6er1+yZtOdyySowmzRenP4uRCpzUhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qro9B+4Z9R7TSSB/++OWfNPTZgns8vEXVVJoLjuFYjI=;
 b=Tnod5Rd8u1aGsYm3ch+5UnMvNjM+ijeKdUl0gkmG3M9+Pyri7uMr1E0DP4dufhJtFapiuAtJsLVFNn+g2reJtiLCgEFhqJi+dW8J//Fj+eqIlPTXgiOnskIsRhyrrwuBTOCf7uQybnMwuBp7XYqFzEg27IBy6fXEOJxapR+ncRc=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by IA0PR10MB7604.namprd10.prod.outlook.com (2603:10b6:208:48f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 05:20:33 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Fri, 2 Aug 2024
 05:20:33 +0000
Date: Fri, 2 Aug 2024 01:20:30 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com,
        Nick Alcock <nick.alcock@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>
Subject: Re: [PATCH v5 2/2] unittest/print: add test covering module-defined
 type
Message-ID: <ZqxsnjFKPwD3d1hb@oracle.com>
References: <20240801212912.2300220-1-alan.maguire@oracle.com>
 <20240801212912.2300220-2-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801212912.2300220-2-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAP220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::31) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|IA0PR10MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: 16c314f9-db84-4b09-6381-08dcb2b2d543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?559OADd31F7IYiAQ2CFuQNf5BkmgtfH6t5K5KGdHTBdvYOoeERGwiMaO2jhk?=
 =?us-ascii?Q?4qlKIC2WnmQnC7qyTktL4XLHEJOdhD37pTDr36fiQFX/KAW5jdQV2T7FFqKf?=
 =?us-ascii?Q?0DtIjCFOAr5NFPCN1VE6ewh6FMdv3Z1EYIvocrCSUo3sLhTHmX8/qvViOdXs?=
 =?us-ascii?Q?H9+dZUGZSbdahxzGzk0ALbwFZ8Xeq+CllgHxYF2r6SsvZsUTZh44LCldXiPq?=
 =?us-ascii?Q?/RrZt3eVFaDBFq2stHMRDHEMVJxHE/ybsDZxnCtJ8rNBvM1r9/HuitnUhA1B?=
 =?us-ascii?Q?Wiw47tEQiPPhrXtr79EYWu9L8tfyjINdJtGZV9tjc7/BMaZOEJ2ppPdO5sga?=
 =?us-ascii?Q?xk4Cm2duMLvhGiGzOaeLoNiN1ypXdYaIrJzs2cyr4SEJSi48wUefpZUs5iuf?=
 =?us-ascii?Q?wStfMnR3HIlE1yOn1CyxwzfS9gdwluL4i7lfGKKRBe45YVQ6D1SrfFwokI4H?=
 =?us-ascii?Q?0iGIPj12NnNvcSsJe13Dab2y5mrGn8mi7vzOG2RoMK9edA7cp18Jo/TBvJ3/?=
 =?us-ascii?Q?e5a34vktgWi5iF8rByfTFjV06PnPiqKTi6cUyZIHnVROSf57sy4cXOURWGI3?=
 =?us-ascii?Q?Qvd298tXvmKqmot+TKUghNMkgijKlKUk1mXlJ4LYhxJyrr1+T4kM1RR5wedU?=
 =?us-ascii?Q?JOqzydBS6espa+A7eJpjeRILe84fq4UJEwN9fdF3+SlL271zTLry1+zilteY?=
 =?us-ascii?Q?68tu5rKiDgNDce9FV8V/7co6fzPdWysZkFmzMwQWB/oEFAhv4X9UIb38/Nnt?=
 =?us-ascii?Q?CuNZwesV76KBm+Ec1+hME6Tqdb0jwwupWanJM01wPCPJv1iIu29KntTbEtlr?=
 =?us-ascii?Q?G4dzatc9h72aqNC4v1GLoX5TH6wHn7DQC+chZgIS0lNUZV0dAP8qEqY+q8QD?=
 =?us-ascii?Q?9W1f0Y9pb9PWVCRGMhqQ3v+hLbWUT6IMQcl4DcYwu6XwxoZK+wTuQONlatKF?=
 =?us-ascii?Q?k+LHhy1p6x2KIC6V4ehA7gZwLpL7hoy6ekgqgh9S8M8B+doSWV/X0nhdFHA4?=
 =?us-ascii?Q?eWOGq5HM1j5maG21WQdRCS7WOPv85STWyOFjX3i3KOSVEvih2Kp2V1bjNSN9?=
 =?us-ascii?Q?Nqio2B7rC7QuxkJw2lC85fd1V/hd1u02s/lqKs3vgNAkGXyNmHR7kJK9wiDg?=
 =?us-ascii?Q?yaNkBAx9Eo0ryVnT13K3TTc3kuuc6RTdGPNda806tlhatgfKdwH/i6mV+aWd?=
 =?us-ascii?Q?Erizh1YatnefcceIknYpAynDItXB24d6UqwYkaFLFBdmZtapfVTZmhjCGwGe?=
 =?us-ascii?Q?GeC7CcMPx3ksnkz/kmFvUMimcOqbkphwMRMxw1DcCKbm7vyTpEwqpmvnAHfV?=
 =?us-ascii?Q?3jogQeVIYfDEqPPE+F6OxJU0B86iWnzG3hFCh/Gm5z7peBgN2y+eQ5ZqE84h?=
 =?us-ascii?Q?3C5jTBA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f+Fq3+VSr63FIyLYhWvCmZqYJrOARxz3BRvD5zjf2Z66YTTQvmO4tAnZTTlv?=
 =?us-ascii?Q?00kXalYqe/TCQCjlLG2yH9E4gYtjbkUoLryOFlzvlj5c/BHghNZniCYvAWuP?=
 =?us-ascii?Q?pKeSpi7mJF5SlovHRqXAQ/X8EvhWL/EB1uYW1OSeH4yRkhk+VEEdhms1FR6h?=
 =?us-ascii?Q?k7BIDAvAB97zxZZKIaIfrallAmsKE2G24Ro/pETMvYgPAkRVqBPEH3PgMRqV?=
 =?us-ascii?Q?3LDNA08BvaCmA7i4CCUiae5QTaI3UkPyaC8Viqsx3wyDNbdW2/LUe5EahDr7?=
 =?us-ascii?Q?dcKW/jQp2jMQJa0zvpI2ijA/G1+j/GJQjqda8xTzj+Xx83LgvS4+JHqYxT3y?=
 =?us-ascii?Q?GFGTevWsDj/HGyaLHZ4aambdM2YzWLiE5bbGvWyUNkvFtt7y481xcMfuoek0?=
 =?us-ascii?Q?XxYgbf4gn0OxJNn2LFhYruytu3HA9Ff7Wk1wD2On6lSNXnlEAypjL3vCuKGK?=
 =?us-ascii?Q?Vzh31KB5cDME+uqgX2i8xk4mHejcBk/5myXdDDl3ZvDY5ZIXEUFSiDxInMor?=
 =?us-ascii?Q?qAAhb84KU9T1HVId7+ax3J92q7IRO84RjE2ueDg/xS2Yhw8I5CLg2sFOPap5?=
 =?us-ascii?Q?/a3+D/hgeDkWEASkg6AveQTl19qIRC8I+mfXO+6HUJqeVI8eOBcg5fcZnJ62?=
 =?us-ascii?Q?fp4z3gKWfBvmDPP5+7BmvW1fhWbPXf6wtammQGpO4+M+NjRuUXws3SbAbsAH?=
 =?us-ascii?Q?JZ0LdUfsE7x0e0LLVS6JkRAhJLZdexEiLrL5kyZYrYlNtG4oecldFjG54MSW?=
 =?us-ascii?Q?MD/i14pnKIabfQSZRbFROtep3yeyNbyRG4UUUQfWW2j449XklYEVDP80Zped?=
 =?us-ascii?Q?aH7XUNc+4pMOsW4KJPdO1WweZFChX/4HXxcyzlh72Z5WGFaIgaTJ9V1tSulJ?=
 =?us-ascii?Q?iLzhI4wUHfwjSeGS6Qju+AdAJvSz4JYmILPkvSmHNX92GWldCyh9s20eNcZ6?=
 =?us-ascii?Q?u4DOFce0Uc2hWtz8qisIwnXu7eBt8jv3EslmA0GcXQykmEr3WdEF9POiXQ61?=
 =?us-ascii?Q?J/Xh+VaW4Yh7xZ5E810iOaQ0M9wLS0Rc4Ztv1kBYXqJa0D/yCA+wAhMh4G74?=
 =?us-ascii?Q?vo5iKn8RE7JLuHN3nbFScmgabHpKm4iRLYCJ1E8rjmCFQ+68apymCc3KW6rK?=
 =?us-ascii?Q?NYWuoRJrPVhAmGfIQkZ5DTSYxATJQSZtNMeEz2r0u2ImGWwWbjb0Obei3btu?=
 =?us-ascii?Q?nVblIeQKVSns17LcUxl0E3Vva2ETSuVeu1Opa4pPRBEwNOe9VpFIyDWx/ftI?=
 =?us-ascii?Q?1AUV3hG5Q98JxdyJIgzo8Rj7Y2TE3Vo6LokYiVhbcuP1K0VGi5hctfKEKX0w?=
 =?us-ascii?Q?y46v6mT3dFfIBkz3imhFeOj3ML8K4oeFfkiYC7lVh3RWWPm4CPJlUM04MnI4?=
 =?us-ascii?Q?Cco9LaCjxUhKr9LjBfgrr9/45KkBbNDwh9ZScFmej9xLSjDnLMvoN50vf/xn?=
 =?us-ascii?Q?LM/RujieYoojXXgLFS1hndGugDBQ4yUd69pJHbCLCFwzOOQqVEN6GOZKe4BK?=
 =?us-ascii?Q?uBEtNYTHd7kQVf4UTx2jChb6zV4FhOrHvSDvasfUY+G+3GAPAs6J4Of+IIgk?=
 =?us-ascii?Q?URVo6pgbE+sYMRadS/VyAeOJDTlnAxkQNadzImDwaYqI72J5VxXF6txZ0kZf?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	63ngr9xhIK7wnDLQBloLyZpg0/28JW3lCmGYkADwRgizydWYR9OvFN1nO2PqP9CDRrO+BxRv8q7YarfHDxls0JK+9u5T/udLc8MYrP5repWfTcO3FYigTtJ/2XqnUDq1OzB0nLw8Vg8Tnni1MqL63G87FShUsXwTOen8HmTHcA06mFwf6uu4Y+p9rDSNHQubjUw1WHwbeki2AooaPQGHW0F+g+cRDZzj7Yb3xkcfnLVexy0QIuuLW+7ppb6JhXoDNs+xoQZygOcua5dKA4cPwIslId7ZYwOzTdnu6JHI4nlGSIT0lZosXm6YeWvOYcUSntg0GkgB6YsWqMGB8Uxd2k/dfeXyPMcUOxBadN0IU8r8ZnuCOi2jRpCsDtspo13vBqCCrLeb+QAkC6l1CNxvl7isfYCOUt5ETzb2qfhGTHxAqSyM4wIkXSTAw7Azdkjkpbl3C+lUFDH0SFqv9i7NMj+FbBn4tI4IQ6e1PXMgupHhRXnzfJzLdOCZQJEyTSsWGf/u5mPn2YbqcqtdRJEg0OE5zihJQyVRimVaKaNeS9oReGbiM3JYkkwTl0EBXNlj0ZvFEcmfYSXNCiHbL72/gsr5txUVMnx8XWIHm3db25U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c314f9-db84-4b09-6381-08dcb2b2d543
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 05:20:33.2473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVT84D3nRmobHpCBrrAKcbkBN/wenwr9PMovyJbnEvjEGVUj90znohEydahli4W8bu+vw+viBLxIHZQfE17PzDqXAFA0Q+FSX2s8sTuiAmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7604
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_02,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020035
X-Proofpoint-ORIG-GUID: cNZIdVxNp3iEEiRqUBeaN2_iYK0KLtmO
X-Proofpoint-GUID: cNZIdVxNp3iEEiRqUBeaN2_iYK0KLtmO

On Thu, Aug 01, 2024 at 10:29:12PM +0100, Alan Maguire wrote:
> print() action tests do not cover module-defined types.  Add a test
> using a module-defined type that has not changed recently.
> 
> struct tun_page was chosen since it is identical in UEK6U3 and upstream
> and declared in tun.c which is a module on most distros.
> 
> Added tun to test/modules as suggested by Eugene.
> 
> Suggested-by: Nick Alcock <nick.alcock@oracle.com>
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/modules                            |  1 +
>  test/unittest/print/tst.print.modtype.d | 18 ++++++++++++++++++
>  test/unittest/print/tst.print.modtype.r |  6 ++++++
>  3 files changed, 25 insertions(+)
>  create mode 100644 test/unittest/print/tst.print.modtype.d
>  create mode 100644 test/unittest/print/tst.print.modtype.r
> 
> diff --git a/test/modules b/test/modules
> index 53dc5544..0f01d6e0 100644
> --- a/test/modules
> +++ b/test/modules
> @@ -2,3 +2,4 @@ ext4
>  isofs
>  nfs
>  rds
> +tun
> diff --git a/test/unittest/print/tst.print.modtype.d b/test/unittest/print/tst.print.modtype.d
> new file mode 100644
> index 00000000..ed68b492
> --- /dev/null
> +++ b/test/unittest/print/tst.print.modtype.d
> @@ -0,0 +1,18 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +/* @@nosort */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	tun_page = (struct tun_page *)alloca(sizeof (struct tun_page));
> +	tun_page->page = (struct page *)0xfeedfacefeedface;
> +	tun_page->count = 123;
> +	print(tun_page);
> +	exit(0);
> +}
> diff --git a/test/unittest/print/tst.print.modtype.r b/test/unittest/print/tst.print.modtype.r
> new file mode 100644
> index 00000000..b9736607
> --- /dev/null
> +++ b/test/unittest/print/tst.print.modtype.r
> @@ -0,0 +1,6 @@
> +{ptr} = *
> +                                            (struct tun_page) {
> +                                             .page = (struct page *){ptr},
> +                                             .count = (int)123,
> +                                            }
> +
> -- 
> 2.43.5
> 
