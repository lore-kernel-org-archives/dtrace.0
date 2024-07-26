Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74FA6026A
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 22:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722033873; cv=fail; b=cq5ZnGmjzpLpIHAalqz1asOksfEq5sCjnwmJTIw7dtDBeVnKMDPfSHxO3BTRE4eZN7lXRKNMSmUnJGzG5R8Qybri8F77kBnyAS25XzKYGlmHMrP8nORv6ISP/zdzd/szXhCEu9fpR8KzdnL4Z3Q/vE1CEsBK7owypDZQBvzbYsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722033873; c=relaxed/simple;
	bh=y2ux+u/X3aTMqhjDZmB0eR7IMDNxlNP4oP3UJTWbdks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RuqHR9aOy1GWDxWqr92E5FvNa6bCV87+MrZFDcgOLucBZcy1SHvneYpXb+eDcxoX3yvVzO/4Bsi79Q8KxV6gqkWmnPrQodiREYr7wz4tThIw1g3+KZPNN475GQ1FJlDwmc9BXm43GlG73g4mID+vzPq+s0tolKVsTgp4nU2gXcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Shu04HzG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zoKnSTPk; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Shu04HzG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zoKnSTPk"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46QKhJIO028587
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 22:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=ePM8nzeyHkACg3Z
	3ZdYiQKv7Zz8IDpS4u/bZ66tJgsc=; b=Shu04HzGKknr6z26+zW4rJebW8ocSH3
	RqKN9V4HqXH2HZN8v3b1ZDZIE9uZDiYtw8UudeuJ0GL8eKtFgtZKwX3EQerEhZjI
	pNVmwtgMq2IZWznRXu+SU3Htp4wSUSm7O+EI/8bgmsINLpHCe6k9hnREwVITTahl
	6r/LC7S09UJLlSTJnTX9+OHT4tF54xibSzSrAwPslToUYFQU6SvBAspI31dgnuJn
	+O1Lxp3PT+l7/i7mkQYoSm1DuJ9yyeQQYxDWJhz2Mlmv1F3g0z71cc6vi+Y+PYj/
	c0KvkKIzhcuYeKGFJKdL6SSoNbRGl0Oe2DZUKECR2Ddomqby07zB8+w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hfe7pngm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 22:44:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46QLNTHv013437
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 22:44:29 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40h2a67xmv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 22:44:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBY2X5F1SfS7CZW0H5qKTgBk5nU6zauvTwbmxWrg/y7Xx9tZQIRw/jozTxYQz3L2cv1DMq7cIAeE/EGtvfmQFHd49/d3zDwvU/LnQ8/dmjmgxIqaTn05emixRYTjVnszFDtRaICocWB0y/vWA+oXvuZe5kX7k4uDcOLoinFUj/gBwdnEdjM1jzg3Xy9gsxSUcNIuACAa6d8WRpGMPmnoC2z+mB1J36aSTgHOuOMuE3knTFp4jM/jrGht8oGbzoDeET1ocTuPjNyZgXWVrUn4xlTPUWRw2Cgu8qSoOEhtWQ57vQqFZKYB4lEGm0JUylVMAESHj0NEfY2gcDNV/aHIyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePM8nzeyHkACg3Z3ZdYiQKv7Zz8IDpS4u/bZ66tJgsc=;
 b=aYUB8+XqISw/3+KUzJja0ppWNoXxfg5FlJrAgzDkyHGK0HJ+PLuisFdNrMwYtaGpXt0FtjShEiAun1pnF68mCfJNvHjDxs7uvun//veasF8+iuPyxruj2VugDLALkxWUzBX79zaakKAD3RJqr+O7MaXMT3O3a3+JsNeNqKXmerv1lqdBp0yOTfO7L29UAt+PLmm2z61tz3AW98n3jzROJ0NFIWUbjFSP8X8KL28dxXoGmRMD3LM/GDJ5pmf0zhvwCp4FJL8h1RW94n0kLGL2iq0P9N2BzlA/fnIcRr9HG1HLVb3liBaGEapnWKNNK4o8xYvgGm/nSuJRerU/X2nnZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePM8nzeyHkACg3Z3ZdYiQKv7Zz8IDpS4u/bZ66tJgsc=;
 b=zoKnSTPkRoalIldY9ZFgIHiExV6lpBgb+5JZJM9K4b21k+pog7Cpy0DfSBB5sowiD4TnFHyoMQuPk6ZLDpUz3QPTSRE/KKPeY20bu5xg1ojN1RC78Nly4R9sxVvmdmFSMwDvgHhKZ+1pHDmDeJPFe8uSTbhGYQj+tTVW9kcEek0=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by IA1PR10MB7417.namprd10.prod.outlook.com (2603:10b6:208:448::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Fri, 26 Jul
 2024 22:44:26 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 22:44:26 +0000
Date: Fri, 26 Jul 2024 18:44:23 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2 3/7] Generate clearer error message
 when dtrace is run not as root
Message-ID: <ZqQmxw7nV3gKldTN@oracle.com>
References: <20240725050048.28226-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725050048.28226-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BY3PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::24) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|IA1PR10MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f65685-a2a8-46ac-9605-08dcadc480ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oSoJY8El4N80Z5lE8f3KE23eX7bslCFtadbtQI23/02cAlzN+vBp0EKoTXTT?=
 =?us-ascii?Q?BqNcYaJUIcx9p9574A673lhdSbtEmgzsEGCATrh8QjTqeZOxT7xUJzHeYvGr?=
 =?us-ascii?Q?r91J0XZb3p6JKk1mKKiREsTxE2oCLwWi5r4pwRixJaZoDUmhBi+Ka+8cAm1u?=
 =?us-ascii?Q?mOXdyYykdtPViqhxbKA9TZB/qzxbT8tdcFCRoasP4pYBDbAGaQJ6Y6Z1OOwq?=
 =?us-ascii?Q?0h1k+Ah2iYeNuSbfc6d5eLcCFw3a8JVa+Kzcd8Or6Y5toxyJo+cXhzRQe5o2?=
 =?us-ascii?Q?mJuLprsXkSTs6LXiycatCRUukixW0IdNM/ZcSSQfuieTUH37lFgt1Yn0AcN0?=
 =?us-ascii?Q?wBDQ9jrKfRr1UnhQTNp3FIWKYQMYl8ibv15LHDCZOMy+YW63m9UvLMC0p8um?=
 =?us-ascii?Q?JuvyIhIIoZVXkEc2jB2Br2Zcti61Ifdie6POw9adhDW3Q0iYB+izgNL+1vGJ?=
 =?us-ascii?Q?zEK6BoSFy+sm5zv7OF4nf3JsuAVuT9jusY3RjBiFqlpSn+H6XOZz5gXd3mcf?=
 =?us-ascii?Q?34+f1V/fwEVYdVP5uyR///Tn8Dynim+mBrTHC1vOXLvN4DjR2QwB2n/WsjQJ?=
 =?us-ascii?Q?ArpZM3DwqZji1JJ0V0VUHJIh0YhuQwYi5Nm1yU1Eni1XsKSBPud6cWyE60kc?=
 =?us-ascii?Q?yCzzRxDReu6gcE3FNHwj/5cuu1hecDQZTbnzWa8ATtlRSgZyuKY6yAW5r0gl?=
 =?us-ascii?Q?D8CLEDMKGdtl6hXd3EsycPPsEclz6gVNn+nJ0faMwnCtG0pDbCTVlOMrLOBX?=
 =?us-ascii?Q?dAx2kyYx0sVTfusaC4YjPYCkeSMEM55mmxYYFl1iMi/qiDCSOgGMCy+qWKEM?=
 =?us-ascii?Q?e/8lhHCQMgME76VWxht8SVuVWGDmOyXq7JOn4BrfoGXrA2ATEJ+hIBeLRvV/?=
 =?us-ascii?Q?jVfzvqcdjXDasCayWbpUptFAx7bx6yY3IIF0ayJHrVA7lFjhaIPKrnvbkJ1J?=
 =?us-ascii?Q?kPIZLH+lCuVj0mwANS8TGFeGNbyxq23N3NQwIb3dMYYysTUz+LSmKrJNxESf?=
 =?us-ascii?Q?zL4uoOSs5I236q12XCjMrtJgmd6x8clOIJGFDPzFqgTp9wePVoPD7CdY/oKi?=
 =?us-ascii?Q?TBC5hbTDmR6nt2TsfIqt+Ua232KlGlXEhA27DQTrVKjHIlJoHREn6f0jvEZ9?=
 =?us-ascii?Q?IRRmyv9KQ7UZxjrGqpU2Isht4Q5vJUbcso7VwQ4US8Ct7Y7n00tSm4w8aANP?=
 =?us-ascii?Q?NAOh7iZ3Si3ZWalzA6tDUWez0quw2bX0UkP8h3js4XutwfUul0QN0rYooMZo?=
 =?us-ascii?Q?vun0ZNx7vo/d9BLhrI1yWikZGQF/+e+RYpNzlqEwNkUtHTMMZdkfRiVWQHbE?=
 =?us-ascii?Q?8934ZGgL8PqdP0aajnlUG21ZnDk5c2ggWfPPpOapkQDAZQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8k2+0GIPy3HM6ksSzpXr/RAJB9rSlNy7FFPehFa4YTUJZv7pTDdiHR4l6g/i?=
 =?us-ascii?Q?LB23VEo/G2JXAhWWCckpAdF3DtfOToJxOfflcnGEZSNVEPd5g7VDTjPyoQuD?=
 =?us-ascii?Q?lmlPd7dKvBxE7aGn6SzxNF+pCEWnrqq3a5bjp0ClHCHeFxEBw9wQ4/G86ee8?=
 =?us-ascii?Q?kROFYNkJB574jMFzvKGPnBioG5a81tIGayf+V8SXHvTRaayALJUVLY8NIbXa?=
 =?us-ascii?Q?xRWdi/BrXbXrJmPCp3rL3vFsbIglcQyGnTdKCD4tAKwE3HrVqRFdrdPnhWRA?=
 =?us-ascii?Q?6xgneMU9+INLng+epSFa7ntYzmhgoPQniewciNQeJmGSN5Kp03ll0Y5aw2W+?=
 =?us-ascii?Q?liFYOuhLEtMACmoa9nx/3nPzHfMpesTiOJSl/3GJvq88FNeDgxrPn4haBtG3?=
 =?us-ascii?Q?SVaq9To93l4rGZtO2P080yCLats5AlUwcbesyQIXeasMewpm2+v6+60T46q2?=
 =?us-ascii?Q?iQExW4p5MH0JH4C2pOVBL7hzFkcd3VTxS4TPJeFI9PVcF/pvjf9Y8dEPiz6o?=
 =?us-ascii?Q?JXbBBqjMtKhUzSBK7s7Mc7mOweD/f9b7uN5mRoSG+/RG5hr0nyw7VNuj1mNi?=
 =?us-ascii?Q?CkLqlar4rr1yEJC1/pZWhWICOcl4C6PUYQFuvK9IoOs52Xvu2T0jPlFgzabA?=
 =?us-ascii?Q?rLBkfZd5FpfMFiRzsmckzdxbBxqxeA/YU+KbX0Cose5Iz+lOIMJ8Deq5IFyq?=
 =?us-ascii?Q?AoIWfE5z0Mial82I2VL4fc5RNPXhrZ0feTJ0yrPF/xcXNuWFMGbFimVmeZD0?=
 =?us-ascii?Q?TGl9oP3HV0fkDtLqWPfuLiYc7+ciyHuICy2FOEBfxZ5jZeo6aLCJGC9ejXy1?=
 =?us-ascii?Q?g06uCCA5zBlAjKErXbpXcmzYQsmZkRNvavm3qSZSyHZ8oUWyC/80RuidW4BG?=
 =?us-ascii?Q?rM8ZH9HOzUPeAdy6km6SLoKUbN83qslqCG5TVZqUTtBpj1s//kibxzz0afVs?=
 =?us-ascii?Q?CrNlifGOgb6mSm124ODCANYPRDVp5S2yz9uU5J5J5+b0WX/NFQLS/7rc2UCa?=
 =?us-ascii?Q?HbIRJM2eyJ6YxWK2LSbbo3IhfJICAbKUZmpZvbvuJ050HBE1kaf3vlMT3AEV?=
 =?us-ascii?Q?1eqpqkNrLEsiPi7cJnAQmLBZkSln6AsolcwS6CYh6mdXN2BV+fwNOXWUjl6t?=
 =?us-ascii?Q?EU/bpumEe3yYl3igMDMAixpju2VyA5RbqrsSsm4PD8127dxNapbtOFsSvLF2?=
 =?us-ascii?Q?vPeEkl8mg+fwY7ajzlkgsuLGHMrKeqtvEkblY4lGk6P3qpYFFkkr/DnRSszR?=
 =?us-ascii?Q?LY106DAQn4R9ZQ8yYO4MKwT7EmpazojMDQMCeGS6kcUuVb1NjPwyi0Tcyz3E?=
 =?us-ascii?Q?EV126+dO7DT0N9FeDr7gIgf2zC02geULAQ2hGjdfF6VTA82s+a3fYFazm8n0?=
 =?us-ascii?Q?kvQaP6C/uTiTTeZGmkEZjwDN/nrbbcN0f/SSiaZhDQ5Ni1wNSO4v0/PPy8zm?=
 =?us-ascii?Q?NeudvwBLOwwdcvX24WBsoLseO1D59yCM4cgMMT/yyq4M6CSat7mxSg6m/7BH?=
 =?us-ascii?Q?11PqW0Cj5/pGUyG9DJ3ltYWvGMgv4UDKkR51YiArt6gtUvgozw6fd96/1+5Z?=
 =?us-ascii?Q?/PKi2p38uBZypt3O5lrErY3xnwOzFp+ddMmM7D3SrqiFG42HZfZRV65SikSM?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	F+V2Oxr83veimlH64NoPtf71LcVIAKGYO7buJgsB64A6pAZx6Hqf188Drxfg7h7+yAvMrUqobRH5M0WlPMmDaOu0eeKEh4tERyXXH5CkAAyU+2dwjmMhfCw6pm9zlW1b7SusYLPWt9VGWa/8dzoRZr6/AOizCjerXe7uzxD1dq5YN6Bk03SnqU2e6Z8QfYiOQoeA/nHpzrfWkr0hcYBdI8cPu21NOo7fyelgIOwZoEp7Ef3KL86Uwpv0wpNufwbKwMzHw0uH00Xs0DrsruJbVbMMu9YJVgjZD3s4yszNCVgcHeEku2VoID9Fn7KwqMC7gJG6pxXXWl3LjKwM1+8PYEf/vNyleawpx6VYC/oZRs+euOWYZKcA8MwXWrr3tH5vdvnRuHjSpzflsy/7Xu3+tzhUiquicOLXFa/UJje+6M5CrrsLGxUwfcvPIQol5ZDtL0U6fR5+3Ilmg23eMG03WUIl3UA5iBeT7bDYq5tPKjfp4FLktJ3DQNkS1FPc3WpjnSXyC9NH4SxeevTYAcu+XzPGcNR1fpkQVeGUBguEhqUpvudCPQmjZAALQgo/u5uv3vhpxP0kYk7u2AMm+EXqnBgKBKwKvCye3BH6zuJsf6g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f65685-a2a8-46ac-9605-08dcadc480ba
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 22:44:26.5593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UMZqNsSFg++q3ywcp8toukfLJdGi54i6FyUicG7zfbbd+WxctN6fPHJ93VcJQMpR+l5XSPLWfYuKbdF+WVAioiYXmufurZgPML2Pg/cZJts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7417
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_13,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407260153
X-Proofpoint-GUID: W9B9zVQuooAu-6fAt2a8-2wcCpymqkdl
X-Proofpoint-ORIG-GUID: W9B9zVQuooAu-6fAt2a8-2wcCpymqkdl

On Thu, Jul 25, 2024 at 01:00:48AM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> It is a relatively simple mistake to run dtrace not as root, but
> the resulting error message is not very clear.  Specifically, it
> currently reports a very specific -xlockmem=unlimited message that
> is no longer a common failure.  Generate a clearer message.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  cmd/dtrace.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/cmd/dtrace.c b/cmd/dtrace.c
> index 9c820686..ab5817ef 100644
> --- a/cmd/dtrace.c
> +++ b/cmd/dtrace.c
> @@ -1036,6 +1036,21 @@ main(int argc, char *argv[])
>  		}
>  	}
>  
> +	/*
> +	 * Generate a helpful error message if the user forgets to run as root.
> +	 *
> +	 * Note that DMODE_VERS has already been handled, and DMODE_HEADER and
> +	 * DMODE_LINK are okay without root.
> +	 *
> +	 * Insist on root for tracing, but also for DMODE_LIST and even for
> +	 * DMODE_EXEC with g_exec==0, since otherwise too many probes will
> +	 * simply not be recognized, likely causing puzzling behavior.
> +	 */
> +	if (getuid() != 0 && (g_mode == DMODE_LIST || g_mode == DMODE_EXEC)) {
> +		fprintf(stderr, "%s: run as root for tracing and listing probes\n", g_pname);
> +		return E_USAGE;
> +	}
> +
>  	/*
>  	 * If we're in linker mode and the data model hasn't been specified,
>  	 * we try to guess the appropriate setting by examining the object
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
