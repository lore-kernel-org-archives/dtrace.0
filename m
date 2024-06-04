Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB7D14BF8B
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 20:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717533768; cv=fail; b=r65GevAC+lk/hh9jaQRP+QW5zoI4rq6yPSJp1QkZYc+31z+utRHOga+x1p52bvJJNySRv6p9AtztrPJVH+cehfjZLncLixULYD9AOF7qla9h0J/D6UpHXDOsvIJgJ7XLRgRF9zA5ZyrXCmVgccFjHYdDteRjaVT88J8ivuO4HVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717533768; c=relaxed/simple;
	bh=Cijj/RpG6kaLonHjvdLplP3FR2DudS11WUGX6hE2WpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nt5dptgeEUe8jXYtRFbuH0yVzhpFd6Kcwkbko8jAJsDrlO2F9r+VzrhwlmGccV1fjWWE+d5YnIOJQlC3+E9gCveiG+YAhTt2RWQABMfZu5RmWEC2Wt4Ym6NsYMvFKs85V+EloMQkY86dIqnnjpo5dTIJ+F5JzE+Lzw8RxGlLgqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454JCUqx005876
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 20:42:45 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcc:content-type:date:from:in-reply-to:message-id:mime-versio?=
 =?UTF-8?Q?n:references:subject:to;_s=3Dcorp-2023-11-20;_bh=3DBZY/FhzqvXXp?=
 =?UTF-8?Q?09OCj+t+xUmnhXUvvoDqtTLLFKbusBY=3D;_b=3DfDPKN+fD0NwzadGhCTmcfVH?=
 =?UTF-8?Q?DsQIyH/60THvz0ZXSooyJe83IoR5mqAHgwXCUIGPMQqUg_zcmsX9/BJvi1+jFDb?=
 =?UTF-8?Q?SiaNHqWYmT4XRqYkX4OiXJpRJtAxB1AESNORQDzBTJabiLfZBOk_SSH2CE1yLfg?=
 =?UTF-8?Q?GLDPEOHrsCyfNa670CqxIohqTHzF3ddwgtwnSUHhYwIGzcvem2dTH0uOG_cvyzK?=
 =?UTF-8?Q?nFXOoInVGnSrPS7o1vGfQCUiAoBQFbE0QlHa2I9PwyFBlS2zTOGnfk5hiiSA0Pi?=
 =?UTF-8?Q?_lgk5ek8VCwTARs1K7nINfZXyBF3/cfso06Sy9CLKNER0pgkaVh/EKpLdk+ydX/?=
 =?UTF-8?Q?6RmsZ0_Ug=3D=3D_?=
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfuvvwuwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 20:42:44 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454JYjFW015574
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 20:42:44 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrjcuq76-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 20:42:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGT7OoCUsGaZhx/Yk85h06NxjVstBTBZai0NiX8rATkesUABkraxRcYeWONTQLaKl9gWsZm/sgXXZCSXOmbWupgEIxvDVYwPVgbqgOcyfkbQjvPyk0G/cmOo9aP4mpdDc/nqJwCncj9VGwjN3MnZFm593uIrjEu2enzvfzjcWOp3m/GqW5TKcSQiSg5h9AJM6MBQNDQQurvQnYQioF9mRZLgSM3J5HSdZw+Qb80UW35scBdgEdOntIDGCNEZsGAPuMvsaJgYOFUSLH0gPBRzMf2X163A+0HrkL94v6ylydVwtLqsqj0i9PZIvzNzMAmF1PrWPdpwCwgOFPTgF+pG4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZY/FhzqvXXp09OCj+t+xUmnhXUvvoDqtTLLFKbusBY=;
 b=aR17PeeOMnF4z3C9uLwn9g+TqURje7WYnOQ10Ju2+LBGbR99Ycuy2zlNwmQAhzJEbltZZTKL79u4tbQuIFUwMPdmjC9m2437PrIDiXR0VI3/EPGfIi37c+mhVtora7/iafZgO1fcI6UwTDn5b3BsXrtON6r7olSZ3w18owb/D6GnY0vialn7fS9HFHCY04K25s4yZ96XIOvrfoma1yUYHaL1aWu2hKZ3vl/ERpiAm8kJCxsjrZzLcH0FfKn5qWhuyJukBzSLkCg9EuSXjdPynQw5DLvYGlV6XHHqJUauOW2Sx3YDALi5abmdBaN+nKs+YWyjfYbgPL+AxEp5P7Gqtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZY/FhzqvXXp09OCj+t+xUmnhXUvvoDqtTLLFKbusBY=;
 b=LZI/mSeLV9VGolSQ/uMGwfVFCS/WNSjWLy1U6UtuMCsuLtGlVm18CGFWefRBcgMWMnINrNG2YFT2ZGYzt/MCriis7HfBthQ0YObcLU7uO/mUEnD26WSMS3+pzt58rPScj5zq8ee3Ng138udeKooznD5b1aNL72TaJizmtsME/vk=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by IA1PR10MB7445.namprd10.prod.outlook.com (2603:10b6:208:449::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Tue, 4 Jun
 2024 20:42:41 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 20:42:41 +0000
Date: Tue, 4 Jun 2024 16:42:38 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 03/14] Let USDT module names contain dots
Message-ID: <Zl98PpyXNh2aSbCL@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
 <20240604181113.11505-4-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604181113.11505-4-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:208:32f::11) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|IA1PR10MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: 29491939-2b2f-4ffb-8ce6-08dc84d6e0db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oihsUDXbSyuJNppCbXR6ugUPLQi3qH5Q9C+tvPJbYEJoHmTzTBFU9vVPWlgF?=
 =?us-ascii?Q?lzMVBCfATpUNc/j3s4hFxkj0omzXXPyP5jZApLJy3EMh1tHbtbET593z3+ym?=
 =?us-ascii?Q?M5w1uZ36Vy0dtEyB6VY4acXMfvoIfX3rD+GcGSEMTg90kuBZ9sAkZzgseh9b?=
 =?us-ascii?Q?Cs/kgAkdmAzBzBvwDY3VC2IvSAuVysm2qZytbURFzrz9Rh7P0FVtd6i2aMa6?=
 =?us-ascii?Q?GgIP+TSJZTETZCJ8g9Q2bX6Z1oHQ6E7UtPWal1m80KwgYvfqP/D0Ee4ngktt?=
 =?us-ascii?Q?JlnMFzTtFFFlaX7BJCwaSM6F4eMbg2+Y0Erq9iZ2kB5KzPYvb8MWJfOB3Mj2?=
 =?us-ascii?Q?fduVhWKu9LE9SLrW1qYFp1fdCPycH+ijf49g8WBgHxHm1+eYH2Og17f2RmX/?=
 =?us-ascii?Q?94Bl7bcOeHW7Zvbk306HVl5BB0HIwOdnZsAL/dpo5u4bvxmGGHGGFnaxj+3W?=
 =?us-ascii?Q?TZi1D0H5Olrqb3qzoM/GO6/Jj5JUYI8P9ux5afRznKkZqE7FJI/F6+bxFr5C?=
 =?us-ascii?Q?DO77h8BzcNtGlLKiVSpsrQUb7ciKO6vPFzaUXxQAdrzfwA1XEj+Cw/E6Hqct?=
 =?us-ascii?Q?zcR6CsLgyEfE3OhyUZp1H6frtALVwWPTn0TksbS4cCIsVx1tcLwP/O9D+TK5?=
 =?us-ascii?Q?kbqjBOqE3u6G+dLsPFxgKNiVI7ov+mjlgl9gEG4M/7QITVdZewvHr9DlftVY?=
 =?us-ascii?Q?ATtfHKkgutDWO70swbSswcD+S+WQ8oAt6hv1x6O9Z+Jfx1yVHkVksKKq5aoS?=
 =?us-ascii?Q?TO6+MWROdxrLrBIAz4qlnFJfnCTKl69JTff4HHSGqzFkRrx+WOIyz+AAZpZI?=
 =?us-ascii?Q?mGjCUlgXtusWR/kWY1sZiQZH6yPfniC0dCOEOr/WZHILHKMGoN1HMl4AT85Y?=
 =?us-ascii?Q?SMuKoU1ALFsAm0Ck+DxIcClCZkiw2C99qrVnW9GIlzLRPDXqUd9GlcfJFMtT?=
 =?us-ascii?Q?kQfaAbBR3NDEdrBuB8HI7Ys0aw7Bi9SIgpAm/CaV9qK2v9X+mbSsDrSFaWcB?=
 =?us-ascii?Q?W37wTAybjMk26E+md31KGoo5PfzjWXqmh7IZv7JNfL6Z7dIQCh+WIW4ctsjh?=
 =?us-ascii?Q?GkQ69mLjC0ppCPagu6Xok3dnNmtcFCbZptau9hpHgN6pwOKGhkrUsrZAQSrQ?=
 =?us-ascii?Q?uFq0GgexHrpgcXna5hXlAczuoi/INQr50GflCObJ8RgRI+UyGN71ub4A1seb?=
 =?us-ascii?Q?dP/bVsyDe7CrAXsyqoH/stNQ6a+VDudAy9yNXTUZXlofL8HrvmGFna8DrIFQ?=
 =?us-ascii?Q?a7r9hYpl3CGl2P7ypSXKxFfbwT77ZRgSvkykVwe1K9qXpkc1hCocA1FRchu1?=
 =?us-ascii?Q?JiktdWzZneqCCkc7qfPJrZxZ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tSVVNsOk67GzLm08utSc4Ho6He4yGQFr+sVbAGhM5RuWXwnVLuy1zl7bDCKm?=
 =?us-ascii?Q?m0JPLCSHauThBGpNN4C0CycbJjgwxwRM8sVNu2iGnN3974mYAOpfDpnlzV57?=
 =?us-ascii?Q?ljQJ+PC5m6ZHH2n3xq8nGCYZkI8pOv097+uEUoy3l9SlFgA72nyY1PHDWV5C?=
 =?us-ascii?Q?I43kLY3LiTPxRrV/k4+XTDL+9bmIueHlh5aJqGfISQRpHG7IxDYZ1/ARZOqE?=
 =?us-ascii?Q?poN2zMRhkKu/I5SdRBmyYhBF806Mz2GH2lTRl9HPk8dslHYcXQxCiOf5aeGk?=
 =?us-ascii?Q?zxtzqKghlMQljAyF1iYTGsAQI1pV2k+VvXug1VECe/BIfoTHAkQQnZavV9T4?=
 =?us-ascii?Q?CxyKtcGdvN1r/HJdumgTUyoskXbg8xYhaBAEMmMtsd2sXCR9DGhlhEVH9To+?=
 =?us-ascii?Q?5c7Z854L+fCz5iFXJj/clJVTS08068dNoj3Ym26r2pe3p7nlJHdu4h28QyUB?=
 =?us-ascii?Q?lwc6i3s2lWnfpARgjEJTT9DeL4qNojyjkOmlN3R/Jrh67ojcpGBwJGe9Ov6U?=
 =?us-ascii?Q?na1b1Q+qIzwGVBMSNjQjzHLJq6R5yfJ5fq34rEsH70vD8VRggIXQNpYi1C9T?=
 =?us-ascii?Q?avaX7Y5UA8zW6ZsX8NqhFM6sQQnQvCojCMYuSx3XYicf2bC9uaHWVGUxVE4t?=
 =?us-ascii?Q?XOmKIYH+9i85nNJX8GxXLpEEPMgq28GB9Co+EwARYkitjwvAD56Mn+fUxreb?=
 =?us-ascii?Q?LxFON/bPdXNgA05axLtizaJDYx38JmQd0Trrc4nhrZaNg7mVW45HKiz1IsDk?=
 =?us-ascii?Q?mm1HoaD8Lk63xwceylY+lGi5hUux+fwZtbV1ZmNHV+hG8n0GyLS/fngi57Xe?=
 =?us-ascii?Q?N/7H5Cvgs+knsZH1zdl3Nm4hATL/dhamG1jOmcicGU0BVc2yfooUfff+cn7X?=
 =?us-ascii?Q?Wb4V6tGhlnMBceRt14guUoTXkS6txb00o496kgrLjSnuoOB0RIZTHGhb1YKL?=
 =?us-ascii?Q?FVdVuLFs7IIkIPOWm9gb1F7nu0ndccqGSsMLB4JjNp2zG/mCjv29iWVlh/4j?=
 =?us-ascii?Q?Vw4Deze0hT30QfH7xSe1G6GPi9BVniv4PD2qpmSWDM+cajv27dK324ijiauA?=
 =?us-ascii?Q?P028Y3sjpULm67xMSpo2NDeWpHX4fbuX0FoBeH96Q1DSnElfzOrJhTde6pO5?=
 =?us-ascii?Q?MIx1Mkps7u4JhE/acynGQk/JpZ7euu+R5oWEle+YRzwdsSBvNw51v6xpon2O?=
 =?us-ascii?Q?x5BbF79LIkjcszKty5oJCu+EcvMgRpq0jOJv2qkdA54EkXcJNpX29kBTjGtO?=
 =?us-ascii?Q?3m0wEhRCQ4uBR2gyDywNmHLICFBdOTs+fpLnN19RHsmMHb0CL8HvIlALPPFE?=
 =?us-ascii?Q?67b4UK89mLs9dPFFlkP6fI8c5kZ4AVeoAFHh7DrpZQOneOWEY2WMAHt/IejJ?=
 =?us-ascii?Q?rNsD9iqRBx5RhGneerYu8SqvGw56gGMeqejDiQIQiY/089EuRaHVC+LFFj1j?=
 =?us-ascii?Q?6i6yai1qssYu0hcp260K7bE0LdBIJqJ4EZNmQKPqLiVZHaV/EpGLU0Dmtkxe?=
 =?us-ascii?Q?dhhTcSOhcxqhhb5S9+r7avdzteG7v9p+Fbxa3aFq/pvjYLrhN9ATP/Z7aP+h?=
 =?us-ascii?Q?7ktaQ8b6kXSGrGaTqWpFS5RCauH5MRGdaL8trJb2n40IFKxiDHYNvU5rU5Y/?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Y19Dk7RBBUGGPek+OBA9DBsnKkGbZvInezBokxxQeWn/trThPFoaZ0CUKZ8laM8lkFTOE42+cJsg1oWLd0ctGcmdEyzRn9BxBRZRbT4QKxrJ6gR9dJsR5Af/WxA3xKbzvhtDCPHYDB9i+KNrOsyAdZWypK9A8xnsrukUhTZ9Ckal7n7it5NV2+CmKTTpTWUtcs0cy8KsfJn12GYQ+CWqUsFfRTYHwCoHgtpFwzbGaaYC9LLpk8U2iD9Tj6+ctpPA6bSL5Uc6qRGzTEqwBo2hFTmvgDjrqH/LW8/T/wM7SzYo1JHpnKOmm3yKqpWjNvGruMCfUU34PINppldhnIBuR9677v7eMDa8GoSHpfbah+kUa+ugPE5F1NLgYxreiotXzhhU3+bROUG8YBC2ivmG6DS6PP2z0ABZzEmkdposGYY3q/fhkguI6GSg79ujrZ8sk9DWzKy+gidYgEcuITEGyyS8LpYZQcuFyDRggMDv+aL+nNOi2pCz+WDiO0T0+IKJuCMCrJMPKiyJC/DjuRi++wD/6SR1qrcMSQsds/2hSyp1/S48O0D7NIFjCCoy+7Vh9W00pHONCbap9dLsy6b3D8zdqA/UfsYvchUVzaKQEmQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29491939-2b2f-4ffb-8ce6-08dc84d6e0db
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 20:42:41.1273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ritT/zprV6U6cMtwY7ngm9YStlTJiByaKyjqm2Khg/6LGs2CBp2CqurVk8QZiJFilzfRLtYMo/nIzitZLlFfHxgk+vpgEVGvnwOH1MZJKkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7445
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406040166
X-Proofpoint-GUID: w6kOYbyWy-qU_5oi17jayhBdEd20OvVd
X-Proofpoint-ORIG-GUID: w6kOYbyWy-qU_5oi17jayhBdEd20OvVd

I do not know what to do with this patch.  Either it is correct and then the
code should not be #if 0 .. #endif, or it is not, and then the patch should
not exist.

Consider that the tst.dlclose1.sh test has output like this:
test/unittest/usdt/tst.dlclose1.sh: Running timeout --signal=TERM 41 test/unittest/usdt/tst.dlclose1.sh /home/kvanhees/dtrace-bpf-user/build/dtrace
PASS.
started pid 68990
   ID   PROVIDER            MODULE                          FUNCTION NAME
97026 test_prov68990        livelib.so                                go go

So that shows that the module component certain can contain a period (.),
so the module component can certainly contain a period (.) whereas we know
that the function component cannot.  Likewise, provider name cannot contain
period as far as I know, nor can the probe name.  So, only the module name
seems to be an issue.

On Tue, Jun 04, 2024 at 02:11:02PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  dtprobed/dof_stash.c | 5 +++++
>  libdtrace/dt_pid.c   | 2 ++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
> index 62418b66..44c67462 100644
> --- a/dtprobed/dof_stash.c
> +++ b/dtprobed/dof_stash.c
> @@ -589,6 +589,10 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
>  							    mod, fun, prb)) == NULL)
>  				goto err_provider;
>  
> +#if 0
> +This does not make any sense.  We are checking parsedfn against "." and "..",
> +but parsedfn comes from make_probespec_name(), whose output is of the form
> +"%s:%s:%s:%s" and therefore can never be "." or "..".
>  			/*
>  			 * Ban "." and ".." as name components.  Obviously names
>  			 * containing dots are commonplace (shared libraries,
> @@ -604,6 +608,7 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
>  			if (strcmp(parsedfn, ".") == 0 ||
>  			    strcmp(parsedfn, "..") == 0)
>  				goto err_provider;
> +#endif
>  
>  			op = "probe module";
>  
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 7c7d7e30..93a7ce76 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -833,6 +833,7 @@ dt_pid_create_usdt_probes(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t
>  
>  	assert(pvp->impl != NULL && pvp->impl->provide_probe != NULL);
>  
> +#if 0
>  	if (strchr(pdp->prv, '.') != NULL ||
>  	    strchr(pdp->mod, '.') != NULL ||
>  	    strchr(pdp->fun, '.') != NULL ||
> @@ -840,6 +841,7 @@ dt_pid_create_usdt_probes(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t
>  		dt_dprintf("Probe component contains dots: cannot be a USDT probe.\n");
>  		return 0;
>  	}
> +#endif
>  
>  	if (asprintf(&probepath, "%s/probes/%i/%s/%s/%s/%s", dtp->dt_dofstash_path,
>  		     dpr->dpr_pid, pdp->prv[0] == '\0' ? "*" : pdp->prv,
> -- 
> 2.18.4
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
