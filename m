Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB81119E7D3
	for <dtrace@lists.linux.dev>; Thu,  5 Sep 2024 15:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725551252; cv=fail; b=jA/Ne1WfClUSk2+qTcZ0Ta4VQL/wf5eBkldbMClYdVq4jf6L+3IenonblzYZc7oMnL9KlEHyhCPSPcbw5zr3urdIzMlpZDbz4X9vTKcxoE16ffxEmLFIlf7jMzNcrCbtTQPFWAAD3/wuCM7TShGFXVqGHOlrUM+TZI37sEvBRs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725551252; c=relaxed/simple;
	bh=p40dV5MjV+QX6yP50M3XrDnHT5qc131UA97G6xQ4x5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gdJuHVlzyuPnoj4pe21mDeEvah4g3bqlw6viawtdhv34tTm3u6BrJBbL+n2W+ymy8Ob3OtjP1Zu92P4VXc+eQLOiSMekKJdhzg+LvTd/Y5SWM9Uv5SyfxUQa+Z0bvNT6eJO2nzXTPvGDVv3nkAhKIyUHZ37cdz7JJUPiDNCjJIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KDIDwEn0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=s+a8vxDB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KDIDwEn0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s+a8vxDB"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485EtUnw008073
	for <dtrace@lists.linux.dev>; Thu, 5 Sep 2024 15:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=cGWuKl9ZObU3/J3
	YJvmhDOQHACZsRz69fwZSJJgfxR8=; b=KDIDwEn0WAEyVOlkOvuNM6Dy4GDUMk4
	EBLxDCrIViQKvoqfKBdZ4G70T9n57Dakx9wNF9u6miI6V+VYf4ST5mYwWScJnWvE
	SCP9lf/ujuw+gblyaJKCVxaj/2tC5Iioy3IC1Woc/WDJCU0Eoe62kNFSXA+98sZT
	4fu5byG/p+3xK2wr6Btubf/xL+R5aWNXjy83GU9e2gsWLl2U3hOpEyU28nSJouy/
	mBbySK/KZ3kc+n9or4Qi4svvW3KqjtzzV/riXwoBBnywAITJKwvbmAiiY1uSkpWe
	iPMvTIPGor7e+RN6kBKl11s8mJlHQrzpBSKp0jlFxfMKM0r3fhJHRfg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41dk84q13c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Sep 2024 15:47:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 485FRDnc023545
	for <dtrace@lists.linux.dev>; Thu, 5 Sep 2024 15:47:27 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41bsmb4r7v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Sep 2024 15:47:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRih5MazSKLTrEGKYDJkoU1cxpcZq44swNmjg/NcluUjz3fUuJBZJ1B0ZSquM6UGY+F9W05uctjD9MWQpWexHRynT66YzAzCUo3QTzw37X5oFQRSD12hpfPTRnQebT9JAZcJkRk+8UjUrLTJbDxqqXnag7dM3NwDHoLEdbwHzeA/qlyAaYVJ4psGZlrXg9fwZYWqGlKm1HpRpHHCxXeoHr1MMPrGnai59xQskS/qhUOkFDZFYltgid6yLn0/YXbySHsw2JITLka/B38OWGfNUGoji/e+ZKrgl6vi2JmmVyJawgFLJq4WWBXnWVeiQRgqVQwwL5q1F0dQCzY8mmgpug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGWuKl9ZObU3/J3YJvmhDOQHACZsRz69fwZSJJgfxR8=;
 b=o2DghhZ2p4LBgiPIivffPnE8lF7yrFqtEAfQVQrvokGE+0f4LpmjEUYD+SYiafRQZ8xHb486vF1zMgb5/C/Gc3NjBrxkeIxHfpTSFwbBE500VVEfeV7zJ6gpfAlLdozTpbiRv3tW0BlW2+6nHoTc8Dx/iu0ahXRl4myPb+EA66OOfVBjbS9Vjq+vNdgtZVrZ55aGZ3l5tIyPGAOlHfqMndPzZt2TsGDsLgsK2eeL4Cj6cKFcdtGhkYAj6NgVerZAiUHnpHpuuq3MYcM0KpYYb//tGhx62uA3zAF7jMyyu9JuFSRRsefQamOWraM4SwIt8nBUVHDaScBAi3Obd+ib4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGWuKl9ZObU3/J3YJvmhDOQHACZsRz69fwZSJJgfxR8=;
 b=s+a8vxDBMqcNJlZJise06/jmY+hANmWiG38rABLwHT2dPZ9IoVlxX1Uvs8Uu8mTMdpIXZhbWWZuj4t2/QbjZhKSIDV0oExzOy01mePZajk6Q1o7DHkbPEypciETo3o/OxzNOKW13xjt/pAIzoO5HnLz4JX/ttwYDGyo7pVNiqNs=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DM4PR10MB7427.namprd10.prod.outlook.com (2603:10b6:8:181::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.16; Thu, 5 Sep
 2024 15:47:25 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Thu, 5 Sep 2024
 15:47:25 +0000
Date: Thu, 5 Sep 2024 11:47:22 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 01/22] test: Handle dtrace:::ERROR arg3 specially
Message-ID: <ZtnSinIJD8MewP2h@oracle.com>
References: <20240829221819.10237-1-eugene.loh@oracle.com>
 <ZtE7hV2L86TaG6M1@oracle.com>
 <ZtE93QS+vPcbeq7W@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtE93QS+vPcbeq7W@oracle.com>
X-ClientProxiedBy: BYAPR21CA0015.namprd21.prod.outlook.com
 (2603:10b6:a03:114::25) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DM4PR10MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: e3cc6b6f-d67d-4dad-dbd4-08dccdc209a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n2pB0BPN2xceZbKu2daunmKZ40eVlIddVnyn1EH8qol5tSFsISprA1HH6t38?=
 =?us-ascii?Q?2jSs5Z7PyOzSKjWGe494nps3/K+jTYvP7ZyEnVluKPsxCGMA/qyeHSpZFrso?=
 =?us-ascii?Q?61MulDxrUr9YKuf3e0vIBohyNrqMQRIh4IIWIg24iEHETALslxK5+yZNl/w6?=
 =?us-ascii?Q?ibfjitTpDAaM/PNMTZUWA67q4zjQcDBrqznrrJDoc2HYERDvAaWbTDEl8XOr?=
 =?us-ascii?Q?Ps8A0peEH2X22ykHUsA3wBuWPWrD3rAhXccKggEboJXaMPOd/4Akx/Mp9GZ6?=
 =?us-ascii?Q?wz26266XJd9XgAE0tOlODLYu1K8yMyNsNIcAEjxUN9cJTplgOhActvlJ/4Ez?=
 =?us-ascii?Q?oqsxVegKUriXlx2kpJ7FPhdkwI05kRRrutkdvi44sxImyxloaJLsdgi70AQV?=
 =?us-ascii?Q?DNJ6YhT1XIfwrRUJp02WhQWLxYo3ZuHUcR7OC+QGUznwyMaqmLFUboYtUxAM?=
 =?us-ascii?Q?HWqFNys/AnOotVmMs6OCo9vUg88C04vNay/7JSEeuRumlzUOVyVlT/k9CqJ4?=
 =?us-ascii?Q?S4ZPT3HKs//zUnDLfiM5dUBDsnMOmoPi7h+51nMTA1d8UXdZ/6NxxAcIM7rM?=
 =?us-ascii?Q?nFa1luCWymGV0RiREU8HPcTrXobF+YbvEK0Z6NO4kA7s3c7Nw+ga+Dzlof89?=
 =?us-ascii?Q?KyDMA1ahpt/cNPwXaqVRTLb6iLWel9py3Rclpx5JDcWG2jiYfIRaJ0pCExcM?=
 =?us-ascii?Q?4wk6r4eWFKzkzDFlbjyrgbaNkDf1YpJ9RMlrKI+Gq7K1z5b9uoDNEg7WpQAF?=
 =?us-ascii?Q?N6LsVQELur2oDmit4/zHEcGt3mf2bKSv/k6vkcvXq3p/JN/WtdaBi7yuRDqN?=
 =?us-ascii?Q?PC2k/OlmPfqmRpZWMtY/uBRAK38RmtywkJbOUkI8S6vSiEzFpNUAgbBBEyc5?=
 =?us-ascii?Q?o9NZQhD4cMafbvs6qouxeLYy+kygkg4s2EZscWS7k0hp2s+tucgmQxu4Dh9a?=
 =?us-ascii?Q?TACpq/AwiXzTnfWu3kQOuvZLHY8eUgBZDpidZ+LhZrQweSqyM+lE/XsoohEX?=
 =?us-ascii?Q?Fbq8B6EXNB6alB3hfd8lVo2JcMInmyBGgkJB8Q079aLi/G8r5u8VGRPU1KXP?=
 =?us-ascii?Q?8xkphi3t9sUbJT6OKoJoahLw66e0KKXKANWDYbH05LyRSyWd4PMu73uVmQXa?=
 =?us-ascii?Q?KTukGv2YNPcJQpE/0wlqf0tSl1/HrzHyW1uihChvN2AMoM2qM9kHSwfVHBlA?=
 =?us-ascii?Q?/87GwLzjM4FayNblbiEoKn+HhFMhWzBgjYYDDnojt8oYzWmGtFJEyqgL7RiE?=
 =?us-ascii?Q?J9K85HG2taDFN833kj4ATflZxf5MgPd4shixRmVOcefGE6qMoyl2KfMCJ5bl?=
 =?us-ascii?Q?WYR68GgyfWHU8O66a6/qqT5I8Pz6+WXg5/j/BtoHBFtZGA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6tYqj5QdJP+nwwA87T2CbJYBF5OYkpWT5J5X4y2QhNMTi0HSxpXS93MsIY1E?=
 =?us-ascii?Q?lHHgNdTap3Nb3Rc84pY5FOoFEmuGxKsOuuyQ2uH6E1Imd0G/7xreR+HUGjgS?=
 =?us-ascii?Q?XQuCFezsJYntN8z4MQczbtIERduB38RUvoLzNLuJaRC52W+tsiYJpMQRqNy6?=
 =?us-ascii?Q?NJH7/V7KlpOjRha4Mh9QaUPa+AyEIF7PhSG7PhzXUhywWU9iTleNZQMgUSBu?=
 =?us-ascii?Q?drXrwqGsHDKSDgeDRPwwXdjxa9oMKUtvwd6Sege3nRzdw08SfkcG3aDD22kc?=
 =?us-ascii?Q?p6/7yb7R6FH6DLASoY/a0AtHaTxjWavcm6w1i2Fb21yGKIXIj39+GGgC/k1D?=
 =?us-ascii?Q?vBNEuQou58hANaDEPDiUYZPfpH/bb0kz5goRQRQs/B250DvSPrDC8Og87FZ8?=
 =?us-ascii?Q?8zAbH8CvvUFI5JuAS5OW5qN8/UBC9gw8tPnT5JZwtya8xwCLRrQ0TMI8k4EY?=
 =?us-ascii?Q?vL0PHBJbDE1ATGYxdq/S5jFdbwbAzLbcZGAnr0GqIdEyACJylF98gQFTJBE3?=
 =?us-ascii?Q?8ps/mCFm3AikBzICfdoe6CZn7lK6qNAP1Im6HQIk4NfcbMrPW4iAfa3ruIa6?=
 =?us-ascii?Q?oQwlDGgj+WhuQK29Uo2KLBOTrGLRlgycHm+s83YaAtdMhGlSYIN+bMokS2dh?=
 =?us-ascii?Q?lxbTajx6nem6t+iQ+UT+hp6Tpi9308Td4POebzKVEjZU3AUpqSoIUTxcVH6I?=
 =?us-ascii?Q?l0ArAKd1qfSNNJXURx+UyUuLY3oZs1ugC/KoXFczMb9QTvWCpHsk4NcnW/YL?=
 =?us-ascii?Q?+mUfzwEEuC4mwnT9nQDadWktAEsTtayk6S7Rm99aahhnTFGZwnYTQjMVhMR4?=
 =?us-ascii?Q?qrYz8vgdaICpmWt3gZ1jocCYhbojhIbI0/g7CjkSkpyhjai9RAK92c2EtHR6?=
 =?us-ascii?Q?q32DukPqSJPRUK8a1NctwWPsRmcHhc9cAubocDApkmCiEHIG7jG7Chd+zv4D?=
 =?us-ascii?Q?24QCaYOvlSEC/VaZwMCZuoasnrR3GnD2JB86JOmzTd5iRhlGWATxcEqJJqy7?=
 =?us-ascii?Q?eI151wKSqOqDS9dEvIrDzyjqrpn/BW4Lc9fNZT8dmBusbznAbZjoi94XyF09?=
 =?us-ascii?Q?fT0/8/jxjcKF07Tki3Zuf7iRfehWfsfob3S7EkaxPE5OWx44vM1GBYO48WcJ?=
 =?us-ascii?Q?HVCYfOCjwvRkeLXbz6ivcQMS5kEVGjpFzCtgPJwU4BZva/4l50l8KXGK/aLq?=
 =?us-ascii?Q?x1UecEowLbLQrhJKm03HdcAv8GVfDNcpNunhlFLTKboE5qjFjnYytrVzvoN2?=
 =?us-ascii?Q?xYhg+SmIzixEHjcK+3Pj1gBMeRLUrb1dUNbBOo/RIrW6tENsQ4e53wg8EB8G?=
 =?us-ascii?Q?6evcaVF5dCkeQmeB+zuzdWjhXHbAO/Y8byjqmpyefN5oKJNwhpz1zZ2D4kB+?=
 =?us-ascii?Q?cRaZE/wmqs3dc3kC1KqfdX/ZEb6Z11Co9PaAi9Ca0ALcoovwfp3ddG+iAeBO?=
 =?us-ascii?Q?PQelaibJBQ4kljnHGDj1i1LbRgc5DNS2EOT+PUhsk20aerV3NSyhudeKi1J+?=
 =?us-ascii?Q?XvVfWMpD2rRUzDHE2FpGNbvf++6H0rMabiu1n0gC54dixhxiP5ibXqd92iP0?=
 =?us-ascii?Q?tKujQTM3GEWnN5ubSktrPnRnAQEiH4ovoqHOl3HhPtj3+62Xwh8hXDxviaPo?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zY3q5pH6Psy855Dux24QH5eT+q49f5QqncJtlxovyrNgwvg65k+NhhP939W+mD4T1rQQrVPvfNCSjCkc27fYRCq7tPtR+5FvqloZomXyb26CpFRFOfu+QmqYxYPKs1oijFD4QlSLr9Gq09JgX5IAN9Vs1N2/avkfRKvyESBfYdnj1vcfnT0OXry5yPdEcfgzVG6gSRhmYttKzVqrZNHQ1NN1MsiIK8DWVZOINxNvKfkmnPtrwbtVK/A1xdvSvgrBSApdi2IM62f2vEUwCPRz/Fj+87IOUwNux2KiVtNYqA2uhLVe7cd3Jar3JV/UmYNlygxTasNt9XHUIhxHHL3VAmFYbw9dm04gsHsXFSxA42rpO88VbxAPAId60k95TBJDWac7LbC55h30iyII1mhKVeoMTUQCYQ+p/yqixX1g2q1OWUHPs2iK2U6O8O5pByIENiAEBAqAQcLVzaj/eP9csAmlGj4vNZ/ZGfPpJGEFtQLDqpkdLB2qlAWVzwdhBcutGyXEE4Nq/cDEPohLrH/req/YtzbuTsdy/JCr3QmWW/3QF+I8EvPgyqzpyBR1TgmqamukWjAwiSMNgGecSZ2b8unaD5ndzKPBkC9cUIL0kdE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3cc6b6f-d67d-4dad-dbd4-08dccdc209a3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 15:47:25.0843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yblQ9B3xE2PH0wLqZ7vL0yi1QBa04pX1esG9Fh1V+DYwp2H1XNp3fUx/3wJhvJIt+2mW/DC44Q6A02+8Z+N8n2Ih7PTg5qpCugbbm/jyl08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7427
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_10,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2409050116
X-Proofpoint-GUID: EZ7UihT4bIDXeN6490qMT6sScq5ARj1k
X-Proofpoint-ORIG-GUID: EZ7UihT4bIDXeN6490qMT6sScq5ARj1k

On Thu, Aug 29, 2024 at 11:34:53PM -0400, Kris Van Hees wrote:
> Attachment did not work apparently...  Inlining...
> 
> #!/bin/bash
> #
> # Oracle Linux DTrace.
> # Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> # Licensed under the Universal Permissive License v 1.0 as shown at
> # http://oss.oracle.com/licenses/upl.
> 
> ##
> # ASSERTION: The ERROR arg3 value reports the correct PC value.
> #
> # SECTION: Variables/Built-in Variables/arg3
> ##
> 
> dtrace=$1
> 
> DIRNAME="$tmpdir/arg3-ERROR.$$.$RANDOM"
> mkdir -p $DIRNAME
> cd $DIRNAME
> 
> $dtrace $dt_flags -xdisasm=8 -Sqs /dev/stdin << EOT &> D.out
> BEGIN
> {
> 	x = (int *)64;
> 	y = *x;                       /* 1st ERROR */
> }
> 
> BEGIN
> {
> 	x = (int *)64;
> 	y = *x;                       /* 2nd ERROR */
> }
> 
> BEGIN
> {
> 	x = (int *)64;
> 	y = *x;                       /* 3rd ERROR */
> }
> 
> BEGIN
> {
> 	x = (int *)64;
> 	y = *x;                       /* 4th ERROR */
> }
> 
> BEGIN
> {
> 	exit(0);
> }
> EOT
> 
> awk '/call dt_probe_error/ {
> 	sites[int($1)] = 1;
> 	next;
>      }
> 
>      /error on enabled probe/ {
> 	if (!($NF in sites)) {
> 	    print;
> 	    print "  No call to dt_probe_error found at PC " $NF;
> 	} else
> 	    ok++;

To deal with the potential case that arg3 would have a constnat value for all
instances that happens to point to a dt_probe_error call, change the else
portion to:

	} else {
		ok++;
		delete sites[$NF];
	}

which ensures that any given site can only match once.

>      }
> 
>      END {
> 	if (ok != 4) {
> 	    print "\nFound " ok " valid calls to dt_probe_error, expected 4";
> 	    exit 1;
> 	}
> 
> 	print "OK";
> 	exit 0;
>      }' D.out
> 
> rc=$?
> 
> [ $rc -ne 0 ] && cat D.out
> 
> rm -rf $DIRNAME
> 
> exit $rc
> 
> On Thu, Aug 29, 2024 at 11:24:53PM -0400, Kris Van Hees wrote:
> > How about something a bit simpler like the attached?  We don't really need to
> > get too specific because as long as the reported PC in the ERROR reporting
> > matches a dt_probe_error call site, we know that the reported PC is valid.
> > 
> > I think that would be sufficient as a test for the arg3 value.
> > 
> > On Thu, Aug 29, 2024 at 06:18:19PM -0400, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > The ERROR probe's arg3 reports the culprit PC, whose value can vary
> > > with minor implementation changes.  On the one hand, we do not want
> > > tests to be overly sensitive to this value.  On the other hand, we
> > > do want to check the value is correct.
> > > 
> > > Therefore:
> > > 
> > > *)  Change tests that dump ERROR's args to omit arg3.
> > > 
> > > *)  Add a new test that checks that ERROR's arg3 is correct.
> > > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > ---
> > >  test/unittest/error/tst.DTRACEFLT_UNKNOWN.d   |   6 +-
> > >  test/unittest/error/tst.DTRACEFLT_UNKNOWN.r   |   2 +-
> > >  .../regression/tst.DTRACEFLT_BADADDR.d_path.d |   8 +-
> > >  .../regression/tst.DTRACEFLT_BADADDR.d_path.r |   2 +-
> > >  .../unittest/variables/bvar/tst.arg3-ERROR.sh | 172 ++++++++++++++++++
> > >  5 files changed, 181 insertions(+), 9 deletions(-)
> > >  create mode 100755 test/unittest/variables/bvar/tst.arg3-ERROR.sh
> > > 
> > > diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> > > index 001903ff..bfc77bf5 100644
> > > --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> > > +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> > > @@ -1,6 +1,6 @@
> > >  /*
> > >   * Oracle Linux DTrace.
> > > - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> > > + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
> > >   * Licensed under the Universal Permissive License v 1.0 as shown at
> > >   * http://oss.oracle.com/licenses/upl.
> > >   */
> > > @@ -19,8 +19,8 @@
> > >  
> > >  ERROR
> > >  {
> > > -	printf("The arguments are %u %u %u %u %u\n",
> > > -		arg1, arg2, arg3, arg4, arg5);
> > > +	printf("The arguments are %u %u PC %u %u\n",
> > > +		arg1, arg2, arg4, arg5);
> > >  	printf("The value of arg4 = %u\n", DTRACEFLT_UNKNOWN);
> > >  	exit(0);
> > >  }
> > > diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> > > index b11f6c99..3e7caac4 100644
> > > --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> > > +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> > > @@ -1,4 +1,4 @@
> > > -The arguments are 2 2 4 1 64
> > > +The arguments are 2 2 PC 1 64
> > >  The value of arg4 = 0
> > >  
> > >  -- @@stderr --
> > > diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
> > > index c23f9503..ec519f4f 100644
> > > --- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
> > > +++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
> > > @@ -1,10 +1,10 @@
> > >  /*
> > >   * Oracle Linux DTrace.
> > > - * Copyright (c) 2015, 2020, Oracle and/or its affiliates. All rights reserved.
> > > + * Copyright (c) 2015, 2024, Oracle and/or its affiliates. All rights reserved.
> > >   * Licensed under the Universal Permissive License v 1.0 as shown at
> > >   * http://oss.oracle.com/licenses/upl.
> > >   */
> > > -/* @@xfail: dtv2 */
> > > +/* @@xfail: dtv2 d_path */
> > >  
> > >  /*
> > >   * ASSERTION:
> > > @@ -18,8 +18,7 @@
> > >  
> > >  ERROR
> > >  {
> > > -	printf("The arguments are %u %u %u %u %u\n",
> > > -		arg1, arg2, arg3, arg4, arg5);
> > > +	printf("The arguments are %u %u PC %u %u\n", arg1, arg2, arg4, arg5);
> > >  	printf("The value of arg4 should be %u\n", DTRACEFLT_BADADDR);
> > >  	printf("The value of arg5 should be %u\n", 0x18);
> > >  	exit(0);
> > > @@ -29,4 +28,5 @@ BEGIN
> > >  {
> > >  	d = d_path((struct path *)0x18);
> > >  	trace(d);
> > > +	exit(1);
> > >  }
> > > diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
> > > index 8c601a43..be1f6d5b 100644
> > > --- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
> > > +++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
> > > @@ -1,4 +1,4 @@
> > > -The arguments are 2 1 28 1 24
> > > +The arguments are 2 1 PC 1 24
> > >  The value of arg4 should be 1
> > >  The value of arg5 should be 24
> > >  
> > > diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR.sh b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
> > > new file mode 100755
> > > index 00000000..4b139be2
> > > --- /dev/null
> > > +++ b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
> > > @@ -0,0 +1,172 @@
> > > +#!/bin/bash
> > > +#
> > > +# Oracle Linux DTrace.
> > > +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> > > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > > +# http://oss.oracle.com/licenses/upl.
> > > +#
> > > +
> > > +##
> > > +# ASSERTION: The 'arg3' variable in the ERROR probe is correct.
> > > +#
> > > +# SECTION: Variables/Built-in Variables/arg3
> > > +##
> > > +
> > > +dtrace=$1
> > > +
> > > +DIRNAME="$tmpdir/arg3-ERROR.$$.$RANDOM"
> > > +mkdir -p $DIRNAME
> > > +cd $DIRNAME
> > > +
> > > +function dump_files {
> > > +	for x in $*; do
> > > +		echo ==== $x
> > > +		cat $x
> > > +	done
> > > +}
> > > +
> > > +# Run DTrace, also collecting disassembly.
> > > +
> > > +$dtrace $dt_flags -o D.out -xdisasm=8 -S -qn '
> > > +BEGIN				/* dt_clause_0 */
> > > +{
> > > +	nerrs = 0;
> > > +}
> > > +
> > > +BEGIN				/* dt_clause_1 */
> > > +{
> > > +	x = (int *)64;
> > > +	y = *x;
> > > +	trace(y);
> > > +}
> > > +
> > > +BEGIN				/* dt_clause_2 */
> > > +{
> > > +	x = (int *)64;
> > > +	y = *x;
> > > +	trace(y);
> > > +}
> > > +
> > > +BEGIN				/* dt_clause_3 */
> > > +{
> > > +	x = (int *)64;
> > > +	y = *x;
> > > +	trace(y);
> > > +}
> > > +
> > > +BEGIN				/* dt_clause_4 */
> > > +{
> > > +	x = (int *)64;
> > > +	y = *x;
> > > +	trace(y);
> > > +}
> > > +
> > > +BEGIN				/* dt_clause_5 */
> > > +{
> > > +	exit(0);
> > > +}
> > > +
> > > +ERROR
> > > +{
> > > +	/* Report the problematic PC and continue execution. */
> > > +	printf("Error %d at %x\n", ++nerrs, arg3);
> > > +}
> > > +' >& disasm.out
> > > +if [ $? -ne 0 ]; then
> > > +	echo DTrace failure
> > > +	dump_files disasm.out
> > > +	exit 1
> > > +fi
> > > +
> > > +# Parse the disassembly for start PCs for the dt_clause_n.
> > > +
> > > +awk '
> > > +BEGIN { phase = 0 }
> > > +
> > > +# Look for disassembly of dtrace:::BEGIN.
> > > +phase == 0 && /^Disassembly of final program dtrace:::BEGIN:$/ { phase = 1; next }
> > > +phase == 0 { next }
> > > +
> > > +# Look for a blank line, denoting the start of the variable table.
> > > +phase == 1 && NF == 0 { phase = 2; next }
> > > +phase == 1 { next }
> > > +
> > > +# Look for a blank line, denoting the start of the BPF relocations.
> > > +phase == 2 && NF == 0 { phase = 3; next }
> > > +phase == 2 { next }
> > > +
> > > +# Report PC for each "dt_clause_n" (or a blank line to finish).
> > > +phase == 3 && /dt_clause_/ { print $3, $4; next }
> > > +phase == 3 && NF == 0 { exit(0) }
> > > +phase == 3 { next }
> > > +' disasm.out > dt_clause_start_pcs.txt
> > > +if [ $? -ne 0 ]; then
> > > +	echo ERROR: awk
> > > +	dump_files disasm.out dt_clause_start_pcs.txt
> > > +	exit 1
> > > +fi
> > > +
> > > +# Confirm that we found expected clauses 0-5.
> > > +
> > > +for n in 0 1 2 3 4 5; do
> > > +	echo dt_clause_$n >> dt_clause_start_pcs.txt.check
> > > +done
> > > +if ! awk '{print $2}' dt_clause_start_pcs.txt | diff - dt_clause_start_pcs.txt.check; then
> > > +	echo ERROR: did not find expected dt_clause_n
> > > +	dump_files disasm.out dt_clause_start_pcs.txt
> > > +fi
> > > +
> > > +# Dump the error PCs to a file.
> > > +#
> > > +# BEGIN has 6 clauses (0-5), but 1-4 have the problematic instructions
> > > +# we are looking for: "y = *x".  Each time, we check if address x is 0,
> > > +# calling dt_probe_error() if necessary.  Then we try to dereference x,
> > > +# again calling dt_probe_error() if necessary.  Since x==64, the second
> > > +# dt_probe_error() is the problematic one.  We look for those calls.
> > > +for n in 1 2 3 4; do
> > > +	# For dt_clause_$n, find the starting PC.
> > > +	pc=`awk '$2 == "dt_clause_'$n'" { print $1 }' dt_clause_start_pcs.txt`
> > > +
> > > +	# Look for the starting PC and then the second dt_probe_error().
> > > +	awk '
> > > +	BEGIN { phase = 0 }
> > > +
> > > +	# Look for disassembly of dtrace:::BEGIN.
> > > +	phase == 0 && /^Disassembly of final program dtrace:::BEGIN:$/ { phase = 1; next }
> > > +	phase == 0 { next }
> > > +
> > > +	# Look for the start PC of dt_clause_n.
> > > +	phase == 1 && ($1 + 0) == '$pc' { phase = 2; next }
> > > +	phase == 1 { next }
> > > +
> > > +	# Look for the first dt_probe_error() call.
> > > +	phase == 2 && /dt_probe_error/ { phase = 3; next }
> > > +	phase == 2 { next }
> > > +
> > > +	# Look for the second dt_probe_error() call, reporting the PC and quitting.
> > > +	phase == 3 && /dt_probe_error/ { print $1 + 0; exit(0) }
> > > +	phase == 3 { next }
> > > +	' disasm.out >> err_pcs.txt
> > > +done
> > > +
> > > +# Do a sanity check on DTrace's error output.
> > > +
> > > +awk '/^dtrace: error on enabled probe ID [0-9]* \(ID 1: dtrace:::BEGIN): invalid address \(0x40) in action #[0-9] at BPF pc [0-9]*$/ { print $NF }' \
> > > +  disasm.out > err_pcs.txt.chk1
> > > +if ! diff -q err_pcs.txt err_pcs.txt.chk1; then
> > > +	echo ERROR: problem with DTrace error output
> > > +	dump_files disasm.out err_pcs.txt err_pcs.txt.chk1
> > > +	exit 1
> > > +fi
> > > +
> > > +# Check the D script output... the arg3 values reported by the dtrace:::ERROR probe.
> > > +
> > > +if ! awk 'NF != 0 { print strtonum("0x"$NF) }' D.out | diff -q - err_pcs.txt; then
> > > +	echo ERROR: D script output looks wrong
> > > +	dump_files D.out err_pcs.txt
> > > +	exit 1
> > > +fi
> > > +
> > > +echo success
> > > +
> > > +exit 0
> > > -- 
> > > 2.43.5
> > > 
