Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC90E1A4888
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 14:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722522274; cv=fail; b=k3Hbj+YFAGe8RfbYYcuvk92ZB9yfII0K/D+aFPe0Jz0bIYLalrLk57ppnsxy8Q/5KkKwZa7lWDhlYwc7E/s8fg3wsDVmm9RBGZKihz5qkGLCSUFHLcxlmw5sxpMltuRSs5t3BwwEKCisef6Q9gFXNlV7er/IW4C/2Bb9w7uMKro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722522274; c=relaxed/simple;
	bh=UY6ainzh5yxuVuhjW6OgY75/IpVnIGEhiqLZ/meAUmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EVpQheIbFGcRhN1uMJwtrKvVWRJ+mzPdwuX026P3Z7hUMB/hK1p9txGqFus+p/LNidfv3FshkYwEkK6K0wdgpgJFSF1u/6V8aVIVlPLEC34uy33gSjIjPJJfAq7dG+SXJjiu/hYIMvk27lwyaYzCazp08JIeWg/ds0ACMaS9eRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WwmLeS/3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xG8+mWAI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WwmLeS/3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xG8+mWAI"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4717taZX001280
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 14:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=uZIGCCOJ7C+7b78
	uVWvaeq91B+8KEK0UjKS0fReX2qQ=; b=WwmLeS/3C9mXSLjks/sQvWpe3jwrIk1
	aPYFHZUiZoJH0LuwE435Op7EQAgqx/C/ffdZSzB4rUm6IR1zIKQbk5XdhIbUBtvx
	VY3tVtmfyKafyybsIOnbsXr+UieSGTG5cOw6Bovo3Mlc7p4jst3MhLZUVSIh7KyE
	eCdZuHE46w13Qg4ZoEA5jBPgPx/Z8Xm6efxJcPVqMmtoEQf54fAxpzFtHFvi+Ik5
	AX6qqUrM9fq+AnYDw6RbdwtZu2NBLlQp2PUGaVbIoDxwcVtrxYv0XZorR91M1Pu7
	PUtnLcVEYbMz2DCaOBQuOL9u7NhQ1GSCeWRAxQhdef9Va57fNjTMu4A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mrs8st0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 14:24:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471D2I1B035587
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 14:24:25 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40nvp096tg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 14:24:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gctRVIgBdf8ktewSGzDIkWVNTOzpcyLU6LtrEhQr3ZV1pwd2Ekp9XPB8ddZU4NpDUJrV8nfGch/fVlOKZh7W6/m5SnP8skP0/3w5h3CBghxzyN+SyfNmRoi6L3RBcx/v6WvDL71RJRPXM7YP/2AAjLjOvdOfxYUw4tdtd52Db0D1SAs1mqi2aTyrlAjWOSdn2sUBiwN/mYXlV5WOQSaSiOwdGaVI+8Av0do9hQHCcee6qaIc4R9n5ficNZbdwl+EONN78Zs2R4/2eMEjVCC18UWbARYeBf4a2JC+iairEiIY1DpNdJrfFaWlhdMtwFv0pXT5WKq39HJ8zCc6TaMDxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZIGCCOJ7C+7b78uVWvaeq91B+8KEK0UjKS0fReX2qQ=;
 b=RVGg5m3jg9zG5Gg2xo+nIoWxrS/kAj8RDlnzqx7aP8JieDQTNeO0tnHC82gpiZzvfhxR9XNTkhKPUgCjzmBL13210ifMLevYHBlbVIF/BKrsV35yubeNNifVr/BQo2zslnNNGyr8u5ZxiGOV6Vks8gIQhSHSjlVAOub7CgpVKkHP4U38uswXcnX+awpE9H4+1OWs6fxqdqmxxo5ANLCFa5Rs7EwEK8p0MEcHVuwoXihqJOMEj9ugrVq4kDBTPQem0KNY3PbmtfXRhRyjSr2Y2mBTKmdBnd9h6U1WjHIay0ZYoAHfQFu3ADbz1UTPchnFnSi5Lr0dOPrBxH0r5Ta7MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZIGCCOJ7C+7b78uVWvaeq91B+8KEK0UjKS0fReX2qQ=;
 b=xG8+mWAIfY6j2euaWaLj13VGxNEPws2UmpT97fVtgXimrNFocdvMGUOPpMY660kEa6y5N0+VjaJIZEKEOhHZS5wrBhDBYPNMvYK19XDsF0uAGGo4OZyCi0EUmIpBgSI4lMf5HeuhOMGEyfAVLyyKrJacNY5wyJMIFGEl4+89Deg=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS7PR10MB5055.namprd10.prod.outlook.com (2603:10b6:5:3a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 14:24:18 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 14:24:17 +0000
Date: Thu, 1 Aug 2024 10:24:14 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] fbt: implement return value support for fexit-based FBT
 return probes
Message-ID: <ZquajuExsHKfBC6B@oracle.com>
References: <SN7PR10MB6287AD841705B5857204F3BEC2B22@SN7PR10MB6287.namprd10.prod.outlook.com>
 <b5514f26-dd94-f055-509f-b766313287ed@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5514f26-dd94-f055-509f-b766313287ed@oracle.com>
X-ClientProxiedBy: MN2PR11CA0026.namprd11.prod.outlook.com
 (2603:10b6:208:23b::31) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS7PR10MB5055:EE_
X-MS-Office365-Filtering-Correlation-Id: 962a6b47-09f0-4416-ec78-08dcb235a062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pXsY+2I2ysoJPIVGwBVG+OtnnRHyyECwf5lnsnA2ktdf+js+AvnJ0xAyiRls?=
 =?us-ascii?Q?38vxpansTWUFBbh0PsS91cFCYzb8nS72nc7UWDnwnDhQBCitWdAvREgoam86?=
 =?us-ascii?Q?2Lw2ijEfASW77FR97B/oC1PEjxM5jA9uKa0WAN/krfaW+IvT4yoEIwXqANKj?=
 =?us-ascii?Q?PjrKT3RvR4nJSzI6Oq8UWZ2xD6ADt5/LxhXgPeIzj825GfOb0aQtcI2qjr0/?=
 =?us-ascii?Q?6gIQgzS3i0AdvRrYeu217EUbGjJIgfuzR80XG1F976I+uxcA8aXdC0ez0fS9?=
 =?us-ascii?Q?bGKqEOwGbgcYU0yA1SeldY1xDsox1Nh4rfss/al4MAzWDNwfSq9NEzzfhJAr?=
 =?us-ascii?Q?MkP4QJXVv4GEJTqMhrEXde9G54l8LhZdKM9FZrAnE4WpNfHBDLsbhhWeLsf3?=
 =?us-ascii?Q?aYrG97galbzsMybwWGjmlXc5ZGM9+bWwXdk5qvPVxVulckqawxgzSerlU7pI?=
 =?us-ascii?Q?thp7+l6sYCNLx0eCeP9EELw3akPHUFxg0NC0/GEC4WucrI1QAvcZlo03tfKR?=
 =?us-ascii?Q?OND7ymnkPbX/VXS2C0XS58fy9b6bVzhHwbeUcw0fgdV2QxYpbMslwnK6h+1o?=
 =?us-ascii?Q?lnS0NuVTiXxDLg1NZJMwcg3QL67LPd0g4BkNl6L+jhuHFD06Khrc0DcyKAhQ?=
 =?us-ascii?Q?vdC8s9LUQ+OhLSZyHrKfW7hB6nJDo5JMjhHDyY+LxI7x+1FSi4kMuBaN6MtE?=
 =?us-ascii?Q?u+4hyEoXYM8iXNRn829U/wAYdqXe1xw5Eu/mintQXppHkMFlWq3n1cmg8nTS?=
 =?us-ascii?Q?8A2cCrZgYHGggACbtITOsiqwKili+lDrYUXKS1ATS1T2mY+QOi94IOfOnY2V?=
 =?us-ascii?Q?IkcD3PyKwuy+UNQ0Lacgl6tVZMEtNL3zFt+DG97j7OBvtDGqtE4Acqz2faG1?=
 =?us-ascii?Q?dOmnwpZ38y3SmHcwDZh7QNqx+J7PVKZ5ZJfWrHweW1yLhLYkk45byJsmw9xC?=
 =?us-ascii?Q?7Gw/HqFhgfjBkrvbcqDVHyc7F+Za6f7cvGDaJ0Py1Itkl+Kbfi05vM2PrvSk?=
 =?us-ascii?Q?2VK8jsRSRdFZN934r7cCBgrnySE+GOPhfK/+sfbehD6a852QWfAg90EV20U5?=
 =?us-ascii?Q?798F6IAsSbAHBxq+7Us23OMGqsdPlJRAye0rkJ4A4Ne4I44m0sJgcHbTW4Fi?=
 =?us-ascii?Q?45hmr8R3KBJ6V9STSZ82I4hWqq2ddwJ8u6JxuRtmoIMwMKujqmzo7WUKVNVN?=
 =?us-ascii?Q?B6KEmYT07nHw0W4pPTbsRJxiywNrVes/o0lCmtMFoL/Anq1k3rKd5mYo4EM1?=
 =?us-ascii?Q?wXDLTKYa0g7oIMvcboxSjQs9mNZjs5KaRCrAMZa5RtdTkNWvSgk8rfqgRa6o?=
 =?us-ascii?Q?+CicUKTYoN3X2wgf2NeTF7/Yw7M8wgFhXrfRTNud7ZoQaA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?On3yD9I2NUHLG0ciKxQ+orso3PG47q2AbugZEWnWGGuSVElS4Fzo8KxvaOUj?=
 =?us-ascii?Q?do/BjXSCtZKxpds8odsBM11YT0fJ/PG4YmzjsRjVbyFhiSkOXrS+/FpRQzUU?=
 =?us-ascii?Q?Oy6tyv/PW926A4vMJry9teHHfqMoxUIC7JBJ/tgpwSRz4jIRFHVNz3pI4Nty?=
 =?us-ascii?Q?acXXhg9iNHgeFq3qb76t04cs+Cf2eeds81RfRpLxkiJnoi3xtRg1I9UrYeKn?=
 =?us-ascii?Q?0cUQj2IgErmdYpIDgiOcMYM0QosvK18+L4q5HrOCqofdGUGKMFP+ubaFrzGb?=
 =?us-ascii?Q?8+tF0vsRT5QjXbLotEFP6fk04mCUNvJcwp8qaa6isuLdPOPjDS6d8dAS5JvI?=
 =?us-ascii?Q?NpFpqTH3GVEekJmBJFrg8nUdJ34Bsk5kq/B5sMPAUyDlJURuOIijZ1WyjfVG?=
 =?us-ascii?Q?qCsuJJmeQ5teFLUD0b5+8MVtFiNJ+9JB2drDskOkJIwm0Q/MyXq34YE+0ROj?=
 =?us-ascii?Q?v4vYJHAXN27RAnYC/sfoZIHs+6h4+to9hDYXvsTC+rMZMC4Zh4TRzr6USIVA?=
 =?us-ascii?Q?D9MrwE0tQXdUlR6J8879u7I3vrwgJfvKqYcnyriu6DyejGFaofDxILlEVezf?=
 =?us-ascii?Q?xAxdeArYZLpgJEAlLlLcwIAZEhhvSCT5NOKIpOEO40gTsvqy2FsDdWdR+y6F?=
 =?us-ascii?Q?6GLXLYAE1E8heAC2WNOXZpRTd53WilrS0Xhehqp8dnCU7Kp5eMOyEYNSo7uv?=
 =?us-ascii?Q?iaMIBIGWZL53ebySncQ0pcgVffElBTaqRYOX+var0QXWih6jotEpzH8oMZu0?=
 =?us-ascii?Q?CLvLFPy20DL8l6JJhXx1VokIkt89u57MV0gqzrr8n7ZYVlUi/+CqxWXdrsyt?=
 =?us-ascii?Q?eQZvegt7Ss5HnD3Mt/HfHdpkzOz73KLoX7eqtrDOGgoyHa5NuXErrog97cSk?=
 =?us-ascii?Q?ftPJDSajpZ1KXaSCIV5aDrIHVZAs2HKtlt9J12EASuusE/nAYq5FuoVFx0I6?=
 =?us-ascii?Q?37ToMF+lFPlnZ9+4VsuFER3w9RZ/FtMBvSmkDwScOGrnS4laCr+lg59E47pU?=
 =?us-ascii?Q?wBZ4Ha5UL+JVCqm+lE0PehZl/n80qzJAYGe0N10QsiH2bW1AW0Lqjd7GoMqi?=
 =?us-ascii?Q?hboz0vFd+liRCZEpTVRQMgQKVuaf9PGlKI4EBm4IOjxLXtMaig1yKdPjNmmr?=
 =?us-ascii?Q?tQmmFR3eyZWcW81jdFgIBZ1PWh86Xp/wSTlJiFqqii8Eh106F5CBUTmuSzOQ?=
 =?us-ascii?Q?GNHr8AmNlpLI9t7JyuewzibdFMzI0M+BYr7cnr2vjZhEMZHENcEVL7/8nSCm?=
 =?us-ascii?Q?z/FAK4fLHVU2blUxKRNuFWcDAJm6OmvyX2mSjlz5EhC3mifxjqmQAM1r6d0o?=
 =?us-ascii?Q?w5LkWgpCDMg713crpyCBX6EXIKnCjl6DGdFJoXGMpeQnSoU3G6r+nS4BtUcZ?=
 =?us-ascii?Q?+48f+69aZpG7VZ7CfShu69uiipSBh/bNq2d8Ey6MdBFC4vZzq5Cyw8BNp0cm?=
 =?us-ascii?Q?yx7cWCSELeoP30+z8U2jiRvtGg607TN70DlYntdLojaB5ybILLwqYZp6IvJV?=
 =?us-ascii?Q?2q6tHe9h8ZohjWwsNFej18NLMqd2dhc6DtKHm7lLOu+Gc5p+AMLAs+0oWQ9K?=
 =?us-ascii?Q?JeNiCcnB9sOde7atubYQ3mapes6MJtyYm5E1IIJGEiue6Qrle92+CH9UP/gj?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dacSml3XWAninnieULekpwLUknawsWNkMvMMKpHt9oWoS+v85wayfYn0qDLyTMD3UXDDQ6Pxpf2Ihu0vz76/5gjuD2h7cZG/tucTe/ybWkCp2oqQ7nIoHtBQB9SLlVzlbeDRurGszI020TrE+egFTfEViHugxddG6Tp/wNf/+1CWnFvfb3tgWV94rDpB8icDkYqu8WBn1UEhnWT+KmIXCbBIvmOO5FoKvqRlviGkWYGTQoXq2mqhwFz0pWuwB7bEY0ui71WscC7svc/66CGnFpZxxaQf5pwWDJxcBDzyYs1Q9vtwAopWPPrW7zlTaKHMQaibHfDsO+xfJD5zjIkfDNXOTGH3bI3lFpVsnHjEkgwfsD/kdisd7NmMrb/HMxl1K83FBPpQ/XQ0EX9qC+7372Lg5NLeYwPIuXQeqmPKCsRZdHV4EXzxTSZnwTVEJ1z0uDbZPtfp4qXaoAMMV18KCvEaGw4wAHuNXFyfEaoPP16ZnAZDh3v7NOKPfwGLx7RA/7dVw7G+NwQAnVeCKlMrlld0OOmCat8jJeAiRjcKI5EDKQYUvVEqdx2N0gHI4l75CX6hQHbJF+oHE6CJS9BexSkDbWIxj2c4Bhii/m4DpgM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 962a6b47-09f0-4416-ec78-08dcb235a062
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 14:24:17.4998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Wz/ALleGiCjN9AhuPn5zBuAWcInjRPIDVvNndts7W3KlMfd+e/e83piaJyE5fvBd12ztEg6Nz4Ky5ViK2YWFPcmGwEAe2N2TiKeIps/IBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5055
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_12,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408010093
X-Proofpoint-GUID: 0kMT0NzH_9nF7XkC2OTRAYFhZlqHslXD
X-Proofpoint-ORIG-GUID: 0kMT0NzH_9nF7XkC2OTRAYFhZlqHslXD

On Thu, Aug 01, 2024 at 01:49:35AM -0400, Eugene Loh wrote:
> Is there a test?

Yes, the testsuite already contains a test (tst.return1.d) whose failure
prompted the need for this patch.  And with the patch, it passes.

> 
> On 8/1/24 01:19, Kris Van Hees wrote:
> > Commit fe2101e5 ("fbt: implement based on fentry/fexit probes") failed
> > to provide a proper implementation to pass the function return value as
> > arg1 for FBT return probes based on fexit probes.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_prov_fbt.c | 20 +++++++++++++++++++-
> >   1 file changed, 19 insertions(+), 1 deletion(-)
> > 
> > diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> > index fa888ed8..99b42586 100644
> > --- a/libdtrace/dt_prov_fbt.c
> > +++ b/libdtrace/dt_prov_fbt.c
> > @@ -172,6 +172,7 @@ static int populate(dtrace_hdl_t *dtp)
> >    */
> >   static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >   {
> > +	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
> >   	dt_irlist_t	*dlp = &pcb->pcb_ir;
> >   	dt_probe_t	*prp = pcb->pcb_probe;
> > @@ -185,6 +186,8 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >   			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
> >   		}
> >   	} else {
> > +		dt_module_t	*dmp;
> > +
> >   		/*
> >   		 * fbt:::return arg0 should be the function offset for the
> >   		 * return instruction.  The fexit prpbe fires at a point where
> > @@ -194,6 +197,21 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >   		 */
> >   		dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_0, -1);
> >   		emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
> > +
> > +		/*
> > +		 * The return value is provided by the fexit probe as an
> > +		 * argument slot past the last function argument.  We can get
> > +		 * the number of function arguments using the BTF id that has
> > +		 * been stored as the tracepoint event id.
> > +		 */
> > +		dmp = dt_module_lookup_by_name(dtp, prp->desc->mod);
> > +		if (dmp != NULL) {
> > +			int32_t	btf_id = dt_tp_get_event_id(prp);
> > +			int	i = dt_btf_func_argc(dtp, dmp->dm_btf, btf_id);
> > +
> > +			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, i * 8));
> > +			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
> > +		}
> >   	}
> >   	dt_cg_tramp_epilogue(pcb);
> > @@ -274,7 +292,7 @@ static int fprobe_prog_load(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> >   	dt_module_t			*dmp;
> >   	atype = strcmp(desc->prb, "entry") == 0 ? BPF_TRACE_FENTRY
> > -						     : BPF_TRACE_FEXIT;
> > +						: BPF_TRACE_FEXIT;
> >   	dmp = dt_module_lookup_by_name(dtp, desc->mod);
> >   	if (dmp == NULL)
