Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350862E822
	for <dtrace@lists.linux.dev>; Sat,  7 Dec 2024 04:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733546325; cv=fail; b=Je/GY4IDYoR8+PxN0nOV1YmhsviMxdesI9i8L0fKdiQCDvQYO9K8uOLKSUgHyiLvVHYW1W+NIOEWvAfjQizo72cD0V8q4xiwoAZcZ29fZg7tFtx001sJAGP7qjSIp6DNscqbMcFrMfIBX8OzXkLoGzwolN3h146/zYIo6AlBPpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733546325; c=relaxed/simple;
	bh=d7mIxKqepdQmM9czZrwZJHTCHOFgdFxnRtbfX6GgHSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V5zv7p0HhWOludYg1HnDhF7esC+1WQX2aB8yfqab83C4iYGBhWNjQghtdRlRqiV1JJhseIBfQDTMAwSih5B/Ihxet/SpYZQgrAizdwnbmRoL0n+6d6Vvkubcnyh2J+Kc4XzC+HdfB4Mu44+GyfmizmdIW2+HjYXptqjZoTHq+3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VditwbLw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BP/COmTm; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VditwbLw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BP/COmTm"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B74HxEX021860
	for <dtrace@lists.linux.dev>; Sat, 7 Dec 2024 04:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=ybnkogwyQt6lNeF0Vm
	rYjcgMQ6uxpBb6RAT3hoj14oE=; b=VditwbLw8yPSI7N6mLr8mdbobFQ38an9iP
	q1PH50xcd4Hay314VKk06cKk3ljPCpYBg1uF8biFXbovLu7aQuTj4rsLtZHqbS50
	Nvv84Gx3XdHIyQIegNUlNivRHTQPdSl+cSd+nvJkp6C72E2fhWZcc4YxoZ7v59Up
	HEJTYY/waZCmgMChfnViZsFeLRLi326IPRD7+5wL73TzgKD4gIKiuFUn0jN9RnLc
	0Zr5Lk9sZkn1tp7d5hxsmzGiSFiY5dltIm2+ljypiE5DSQD3dY0qmvBuqhKZquxM
	Qg9yJwbWdlOm2bjy3HXWI/DN5W+OkFFxNq+EibUFY3l5P/8stnOQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43ce8902fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Dec 2024 04:38:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B71XafZ008663
	for <dtrace@lists.linux.dev>; Sat, 7 Dec 2024 04:38:40 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43cct5ahfa-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Dec 2024 04:38:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6LVmfl6cJue1ixhFDLNFrEeMaCZMrfGvsEFQ/uLOeRdoSSpjRghEGFtbqwXByHdiCOS4ZnRnvt/7mJPL3Pqv1ZZCYx7amzyb+7trXqjoZGcTlFhaD/FJfPwRc+39TYDi/izsGK17GiSiaV2euPxGKr0GtNGL5ET6kmJsks2jHVS4e31wOrGMkYZe1ePwet377N3sT35QQhoOHo3ZFXEO+j4fhBNpqBhLOFgijLudQx08XQSqbeQOISx/WkBqb4yPJpZDmsFwpTraXt6XG+0Yp0qWm2+/VHlcoShEc/oEvszW7JkmZdJXz6cyIcy41VAKjrFmWISKQUbc/FB6wQ83w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybnkogwyQt6lNeF0VmrYjcgMQ6uxpBb6RAT3hoj14oE=;
 b=LJdo6YSpS2yGCfxCLE+kTFGfjAAknqAqSxLcRqklt6bUAgMd2TClOZ4nrFrpV/8VnziDcoi7XXHqixrLiNUovlFlfh2QjgQB4+PZjGW/hIM4gGal3RlSTArRdBt96SYLt855CLfyIKoWqfAvIL1mSmU3oluvp+exJ4na8h4kvBuV9GACphNNK9eQDRgnmEcdeDg/aFPBNV9odqCy3N7InODnLcB59nK7PzV4ixxFtzmuacjtZVt0gZxPMiFsJLN+yL9BqG5irfL2jzyHQIRzaHM8YpuMkKLvanNTYQhpyJ58h2HqFso1uaAiHc1Qrxw+vX5G3qAzXi19mi4K6bxpwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybnkogwyQt6lNeF0VmrYjcgMQ6uxpBb6RAT3hoj14oE=;
 b=BP/COmTm1H+/hxk5zUF5BuX/4Vg3NjASbUtQ/VpNnIl98bwyzuUvF1TxXvbXCYJpbc5afd0LSSjMLg7bqOQAYHsLS3WGXiitcR5YXedc2ntff8rIEwJvVdEqV/BvI8fILYqYAzVJiOyW/aIVYrDWX4lGTKO9jH/qq4sAGU0SXKc=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by DM3PR10MB7971.namprd10.prod.outlook.com (2603:10b6:0:b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.12; Sat, 7 Dec 2024 04:38:37 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8230.010; Sat, 7 Dec 2024
 04:38:37 +0000
Date: Fri, 6 Dec 2024 23:38:34 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, eugene.loh@oracle.com
Subject: Re: [PATCH 3/5] libproc: debugging improvements
Message-ID: <Z1PRShEInAMO3WPy@oracle.com>
References: <20241203113610.75104-1-nick.alcock@oracle.com>
 <20241203113610.75104-4-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203113610.75104-4-nick.alcock@oracle.com>
X-ClientProxiedBy: BL1PR13CA0441.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::26) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|DM3PR10MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: cee45b2f-8ec3-4ef7-0d92-08dd167903f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P21I2S/EumaQ9qpCHU0NM8ElhagZyA/4GzYc6iMxm4ep81P4rX7HP5/Bpzzx?=
 =?us-ascii?Q?rLc3hMYsEm4ZMzFcjqfLUDPR5r0az00fksikzMw9iaDT+tDiyj+L7WRHw3vk?=
 =?us-ascii?Q?KRcCbsDMCYSBbeevh8iyCNev+PB6TmweH3gnFzZR8WS+LYVcs6XSH44P6boN?=
 =?us-ascii?Q?/WzfzL/3Hrl2tPQzrkmRvTYpa9x/mG/+v4igi6S1dei0GsmULxcscKnP3ps4?=
 =?us-ascii?Q?QDauGxZVgkjSp0tbnIp3Z6CeAXWryKawGeFW0kGSwg8ltDFjlouGKOHUe/DS?=
 =?us-ascii?Q?kX9vKNE+zep74mfyOe4XRYgGs1vWSWGO1dq1Ns2zuF3So8Y0X1SWVKx5TJ1l?=
 =?us-ascii?Q?2tuMX8uy0D1SOae8MRgFXI7wMDPablOfk7jxni1+7sXkuXHOwUMtSZ2ei36I?=
 =?us-ascii?Q?7PBbZX2dMwf//pMZBqSRe8QfI7Jz6GQ67rBMfDUOlwz2z35WPn6bLSYYBFuy?=
 =?us-ascii?Q?Pg00RHt9QlNiNc8IDREnAmJNcTld8PYhCUpQ7GJy2NISOZkC0prYoipqN4sB?=
 =?us-ascii?Q?4z6kKFrlS6K8B9VVGpoedfR068NMNWXznGmF2zhvNoByPBfL+KeezcDrTz6A?=
 =?us-ascii?Q?9CS+UIIc/tbmpbxreRhr/QZ3A00QjowVF+Pnu2/Zc4BXbOI/LQ8N7wv993HH?=
 =?us-ascii?Q?VlEPhKNGfiLtSrBkWMyuDnXLnxq3VF+k8/ou+b0xPCEXiCEY/KBbDCggPRel?=
 =?us-ascii?Q?uZDEwG3cq7PtrUYPYLg+DdO/BalG3Z14bXOW8Z3cdqkmqgZXJ8jRKeADtsDs?=
 =?us-ascii?Q?Ho7skeP+MW6N6bf1YRbmueut8gjdsnbBWDbM2Z9uo6OnUfs8BYZhzAS+PWlQ?=
 =?us-ascii?Q?4wD+meMk4D04mKMLD7aGkYc0Odgbrt8KaZal3GjztJHjwQeZEbHeNNZgSMU5?=
 =?us-ascii?Q?k3WtkHErxRwAA3s8FdtCtcGOk4Rv009Cdw01LTrvUA1tWHap7/Kc63lMEuci?=
 =?us-ascii?Q?WgtI6NAg0h1ec0ayDxhleWeKWLotZmS3tlzATyQ76V52WnbhVr7YYRhROD3S?=
 =?us-ascii?Q?30zwv51wsQYmcIgOIahSz4uvcomNM7BvQB13QqrdBp6VIyxBOQF+zCicvSvo?=
 =?us-ascii?Q?/M6LVp+hmBCfsAamo6+HkqTpWm6PJoL3EX2Q3x5rMlXsul3pUIONWBk+XKPB?=
 =?us-ascii?Q?K0X4kcahRV9NylOLRWBmjLsszuD4yUb8mbS+i4itRCz5+KpeQlpoQwPRpfg8?=
 =?us-ascii?Q?PGvFz7jan+HzEVD2f7/hKKURMCHvXx1C1kWJEXWEg3LCZOuSXb1Q3cCIimNV?=
 =?us-ascii?Q?PTmyllc7sx9QxtmB36+MrZjQpSYh2bZ9YLeI1XqDp1HeIDUq+VN3zwfNDpNV?=
 =?us-ascii?Q?YyGfnWz+EoUYD++YA6wYAK/4C4ctD5QnhUzYHKEL4KTcNw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PZeYun/6qQ9H8s3vQ8/efTQaI5nJ96N0T0C/II0SIFW4NS/xDazHBs2MAzsN?=
 =?us-ascii?Q?To1TtwpMKdM8HW1nzoos1Grsl0jynwJK6qnXcjPFmldoZGQwABarOvYkFKWL?=
 =?us-ascii?Q?4YSkT2n5mkkTS2EmATHO77rQvgarVAPkwPKcfI+I+xiXkFWNI6mH0E3cAOZ+?=
 =?us-ascii?Q?6iVPUkMzfuci3W58E/mWWnVIv1on0efYyVjmS0ehjGzNu5Ixp00b7PULip+X?=
 =?us-ascii?Q?Ygpr7jDuie+oZ/HugSsjggzRkOFRTash98a4Me2ALA/vbTmo/iNuGYAvJe5x?=
 =?us-ascii?Q?LQUssSu8Uc+IQVKJ/ygvRDeDkJFBHv7i9pcpRxX/wYgHNdCvEQraTQ1F4vlP?=
 =?us-ascii?Q?hrfQiVW4ftl963d+TIBH3VWoupQHnnY4bhrPEv3bj6Hsz/T46PlErdKpjLeR?=
 =?us-ascii?Q?6GqT00vje030re0rMsSNR4BfZDR4mpeGHFFT3Eza664tSmqx7egYfD9g5gIM?=
 =?us-ascii?Q?WSk8AQPnwQyGqm/b/zb/Zr8WZXR8lQeossac9zmyRpx4yYTqdWURMhMS2XhT?=
 =?us-ascii?Q?kxacdjzrxxShSBPZIAw0o03T7lep4Lk9aI4kEk4TkGv9piUEtpb44TVihuTO?=
 =?us-ascii?Q?7QemUF8e6nBw6eeixLdwzISrh211kwQcEKnkQr0LVeoVhRRSUkVgFnvjZloS?=
 =?us-ascii?Q?BVBKJzTEx7HUZ9lKhMPTd7xRwrzT28VuGt+60TuM0F1kPbcxhjtAzG1meR/r?=
 =?us-ascii?Q?p5dTY1DlnqaM6jIn8mZqA6bPKtZ0lONxw/bEDIUr8sNFTDnn3X3qU7S3BUc2?=
 =?us-ascii?Q?odUqwgUrb9wE8Q1rBfUjmanepqoGeBO2XBIFUZqnW+89Sxm2kFgMdxBfT9iP?=
 =?us-ascii?Q?M1hpfXZXx1bGwdHqjIAWLiQ5tw+alY2wIHNqIdVY+KevSv06P6gAJHhHAODt?=
 =?us-ascii?Q?LxItN+MKUAmLvuGI2MWTihYP3c1QOeaIHmZs0ew1qHn86aOs/A7ybFc6WfAL?=
 =?us-ascii?Q?rvRPP9Spbuvw2rbKsIpXszijUpWtayk38vhTt3bZ2pbNcUy3RmyU9fbRWDK5?=
 =?us-ascii?Q?Sm5qeGxa1i0t8lpMnQH29ixv5WhhRDDktw7bblT2CaG1t1f5UqeUwGGpDAKV?=
 =?us-ascii?Q?/4+Xl8TpQDa29gZV39yZogGBAU0re/dC5h77s50dW351/ttriqTIJPkVfFoH?=
 =?us-ascii?Q?Aswnka1LA7RN6GwShgVGUlQfx8fduDHZ6M/h19/rt2pMBnbDRBH4GsvI0wlt?=
 =?us-ascii?Q?rj3guvlLj4YPlbG3iguOPp4RsWJunI1fZYxcjRdyyduz2zOuFner3D1yEBMj?=
 =?us-ascii?Q?b+snBoIl+HVn8U1Jsj7tGbeHMZyKg+TvVTXNxDHvL8Wu579nDW2xUrtBm6Wn?=
 =?us-ascii?Q?f4pShhZhatjraefQ9WPPBxv1X1ZFBJU3cuAAdiAtfkpoboVKbh/3RXXmfDjG?=
 =?us-ascii?Q?KrtP3ElHhIKP9bCY4rL2GaeEERROaCuSxqhWMZivxO1+Kr4WhSyEOxWBKtLc?=
 =?us-ascii?Q?Hh2hGq243nEFamde+GFUwCvpA1ML16dLca3r4pizId6jnoMIZFvUCu6Q17uJ?=
 =?us-ascii?Q?BpEe9F5konbH15lIT6SFT+VfLNUm7Ac7LPskSu9Tja6R/iv2Ynmqsa9luBZd?=
 =?us-ascii?Q?cB5hULNqyq8FBi82jkDxx+JwMPL4GpdGIeakpWqJQdZGS1cmZUBamGjDYjzq?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DVpJPppXwLxOciTz4u2SSkeo68+riy26l0iBg5ceOqylEQ4TeN3lf/Iu9mubM1eo5YYLY71SetmYs6mHVy6c5RGFhx9QbeBOoDtXPGFDLRsinxEHMvdwz/JmZfzY83GR5OaS2rhdXu7a0bgsO2A+nPO7njk6n5nbDRITXSZ+JcqwlpofX3wZa4SVc8q1gVL+fAozHbkFme4h9cIuHoP/7X0mJ1VGaDCzhOvHXyZJqRdW/3lBE9gRkg9tdjhV+BEsdF/s+Fk/XW4ZpRKegb1XLMq47OnuvDMMQ33dv5UdxpUdgAxw7wPtlHVeYWXw/udIZZO6d1WYjDLv7mSdliDr6KSK5Un+opmq5+Ssh3uiHwg4zJL5Z4k2+IasA1DYSSACohwVkVGgJnsrSQjxxxerdmxO1Es1nx1vIt5cxoxVYwW4VdSIDGYcJgQdSU7pAbHlDNhHWRijvH/ju3E9CPSBrNaXSTDOVKG3IvKG/7lGA2QXw8udfpr98s8E3r2cnxKk3uxoZz178ngSEdZkF2fGHrciumHxIRgzObnux2LqqxAw3qi6HSS1RPWTKbK0o3ZZVI5uW8R6QIiZQe+eyMzX9SG4l80rZItguFICaJktxFQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cee45b2f-8ec3-4ef7-0d92-08dd167903f5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2024 04:38:37.1488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVLk5Bmf1yDcIqNrTvH97S3QYGU2yI4o7lOgHdbPUNIK3pg1vNZO8TPiyM1WPBeomjTUH70xfSJw0vdOfyxg+376DbkleIaoU6IkhevlN24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7971
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-06_18,2024-12-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412070035
X-Proofpoint-GUID: oHf8Ib2PiwXpxzRvB8pw5noIwbwlzLli
X-Proofpoint-ORIG-GUID: oHf8Ib2PiwXpxzRvB8pw5noIwbwlzLli

On Tue, Dec 03, 2024 at 11:36:08AM +0000, Nick Alcock wrote:
> Attempting to track down the intermittent failures in
> test/unittest/proc/tst.multitrace.sh is rendered difficult by the fact that
> multiple dtraces are running at once, tracing multiple processes, but the
> debugging messages emitted by libproc do not provide either the TID of the
> tracing thread or the PID of the process being traced in too many cases.
> 
> Worse yet, if you do turn debugging on, both dtraces emit debugging output
> simultaneously to the same stderr stream.  The interleaving is bad enough,
> but very often this causes lines to be emitted to stderr that do not start
> with the standard libproc DEBUG time-since-epoch: string, because it got
> interspersed into the previous line. runtest then partitions that partial
> line off into a separate part of the log, rendering everything entirely
> incomprehensible.
> 
> So emit more PID-related info, including the TID of the process-control
> thread; and arrange for tst.multitrace.sh to capture DTrace debugging output
> itself and dump it as two separated pieces: if a dtrace exits nonzero, note
> which one exited as well as dumping its debug output.
> 
> Also, when this-should-never-happen conditions like a Pwait() returning
> -ECHILD happen (usually indicating that we were not the victim's tracer
> after all) by dumping the entire /proc/$pid/status of that process to
> the debug stream, so we can tell what the tracer *was* and whether the
> process was even stopped.  (No impact at all if this condition never
> happens, which it never should, of course, or if debugging is off.)
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_proc.c                  |  6 ++-
>  libproc/Pcontrol.c                   | 57 +++++++++++++++++++++++++---
>  libproc/rtld_db.c                    |  2 +-
>  test/unittest/usdt/tst.multitrace.sh | 17 ++++++++-
>  4 files changed, 73 insertions(+), 9 deletions(-)
> 
> diff --git a/libdtrace/dt_proc.c b/libdtrace/dt_proc.c
> index 41b148e807f84..6ad57cc5f12ef 100644
> --- a/libdtrace/dt_proc.c
> +++ b/libdtrace/dt_proc.c
> @@ -870,6 +870,9 @@ dt_proc_control(void *arg)
>  	int err;
>  	jmp_buf exec_jmp;
>  
> +	dt_dprintf("%i: process control thread %i starting.\n", dpr->dpr_pid,
> +		   gettid());
> +
>  	/*
>  	 * Set up global libproc hooks that must be active before any processes
>  	 * are grabbed or created.
> @@ -1421,7 +1424,8 @@ dt_proc_control_cleanup(void *arg)
>  	 * out by ptrace() wrappers above us in the call stack, since the whole
>  	 * thread is going away.
>  	 */
> -	dt_dprintf("%i: process control thread going away.\n", dpr->dpr_pid);
> +	dt_dprintf("%i: process control thread %i going away.\n", dpr->dpr_pid,
> +		   gettid());
>  	if(dpr->dpr_lock_count_ctrl == 0 ||
>  	    !pthread_equal(dpr->dpr_lock_holder, pthread_self()))
>  		dt_proc_lock(dpr);
> diff --git a/libproc/Pcontrol.c b/libproc/Pcontrol.c
> index c96a410b70b3f..a32a362eaa1fb 100644
> --- a/libproc/Pcontrol.c
> +++ b/libproc/Pcontrol.c
> @@ -66,6 +66,7 @@ static int add_bkpt(struct ps_prochandle *P, uintptr_t addr,
>      void *data);
>  static void delete_bkpt_handler(struct bkpt *bkpt);
>  static jmp_buf **single_thread_unwinder_pad(struct ps_prochandle *unused);
> +static void Pdump_proc_status(pid_t pid);
>  
>  static ptrace_lock_hook_fun *ptrace_lock_hook;
>  static waitpid_lock_hook_fun *waitpid_lock_hook;
> @@ -332,10 +333,12 @@ Pgrab(pid_t pid, int noninvasiveness, int already_ptraced, void *wrap_arg,
>  
>  			if (*perr < 0) {
>  				if (noninvasiveness < 1) {
> +					_dprintf("%i: Pgrab(): not grabbed.\n", P->pid);
>  					Pfree_internal(P);
>  					return NULL;
>  				}
>  				close(P->memfd);
> +				_dprintf("%i: Pgrab(): grabbed noninvasively.\n", P->pid);
>  				noninvasiveness = 2;
>  			}
>  		} else {
> @@ -719,7 +722,9 @@ Pwait_internal(struct ps_prochandle *P, boolean_t block, int *return_early)
>  				return 0;
>  
>  			if (errno == ECHILD) {
> +				_dprintf("%i: Pwait: got ECHILD from waitpid(), state %i, trace count %i, halted %i\n", P->pid, P->state, P->ptrace_count, P->ptrace_halted);
>  				P->state = PS_DEAD;
> +				Pdump_proc_status(P->pid);
>  				return 0;
>  			}
>  
> @@ -1262,7 +1267,7 @@ Ppush_state(struct ps_prochandle *P, int state)
>  
>  	s->state = state;
>  	dt_list_prepend(&P->ptrace_states, s);
> -	_dprintf("Ppush_state(): ptrace_count %i, state %i\n", P->ptrace_count, s->state);
> +	_dprintf("%i: Ppush_state(): ptrace_count %i, state %i\n", P->pid, P->ptrace_count, s->state);
>  
>  	return s;
>  }
> @@ -1278,7 +1283,7 @@ Ppop_state(struct ps_prochandle *P)
>  
>  	s = dt_list_next(&P->ptrace_states);
>  	dt_list_delete(&P->ptrace_states, s);
> -	_dprintf("Ppop_state(): ptrace_count %i, state %i\n", P->ptrace_count+1, s->state);
> +	_dprintf("%i: Ppop_state(): ptrace_count %i, state %i\n", P->pid, P->ptrace_count+1, s->state);
>  	state = s->state;
>  	free(s);
>  	return state;
> @@ -1422,6 +1427,9 @@ err_nostate:
>  	if (P->ptrace_count == 0 && ptrace_lock_hook)
>  		ptrace_lock_hook(P, P->wrap_arg, 0);
>  
> +	_dprintf("Ptrace(): error return (possibly other tracer), trace count now %i: %s\n",
> +		 P->ptrace_count, strerror(errno));
> +
>  	if (err != -ECHILD)
>  		return err;
>  	else
> @@ -1511,8 +1519,11 @@ Puntrace(struct ps_prochandle *P, int leave_stopped)
>  		P->state = PS_RUN;
>  		P->ptraced = FALSE;
>  		if ((wrapped_ptrace(P, PTRACE_DETACH, P->pid, 0, 0) < 0) &&
> -		    (errno == ESRCH))
> +		    (errno == ESRCH)) {
> +			_dprintf("%i: Punbkpt(): -ESRCH, process is dead.\n",
> +				 P->pid);
>  			P->state = PS_DEAD;
> +		}
>  		P->ptrace_halted = FALSE;
>  		P->info_valid = 0;
>  	}
> @@ -1812,7 +1823,7 @@ Punbkpt(struct ps_prochandle *P, uintptr_t addr)
>  		if (Preset_bkpt_ip(P, P->tracing_bkpt) < 0)
>  			switch (errno) {
>  			case ESRCH:
> -				_dprintf("%i: -ESRCH, process is dead.\n",
> +				_dprintf("%i: Punbkpt(): -ESRCH, process is dead.\n",
>  				    P->pid);
>  				P->state = PS_DEAD;
>  				return;
> @@ -1870,7 +1881,8 @@ Punbkpt_child_poke(struct ps_prochandle *P, pid_t pid, bkpt_t *bkpt)
>  		bkpt->bkpt_addr, bkpt->orig_insn) < 0)
>  		switch (errno) {
>  		case ESRCH:
> -			_dprintf("%i: -ESRCH, process is dead.\n", child_pid);
> +			_dprintf("%i: Punbkpt_child_poke(): -ESRCH, process is dead.\n",
> +				 child_pid);
>  			if (!pid)
>  				P->state = PS_DEAD;
>  			return;
> @@ -2181,8 +2193,11 @@ Pbkpt_continue(struct ps_prochandle *P)
>  		if (wrapped_ptrace(P, PTRACE_CONT, P->pid, 0, 0) < 0) {
>  			int err = errno;
>  			if (err == ESRCH) {
> -				if ((kill(P->pid, 0) < 0) && errno == ESRCH)
> +				if ((kill(P->pid, 0) < 0) && errno == ESRCH) {
> +					_dprintf("%i: Pbpkt_continue(): Got ESRCH, process is dead.\n",
> +						 P->pid);
>  					P->state = PS_DEAD;
> +				}
>  			}
>  			/*
>  			 * Since we must have an outstanding Ptrace() anyway,
> @@ -2760,6 +2775,36 @@ Phastty(pid_t pid)
>  	return tty != 0;
>  }
>  
> +/*
> + * Dump /proc/$pid/status into the debug log.
> + */
> +static void
> +Pdump_proc_status(pid_t pid)
> +{
> +	char status[PATH_MAX];
> +	FILE *fp;
> +	char *line = NULL;
> +	size_t len;
> +
> +	snprintf(status, sizeof(status), "/proc/%i/status", pid);
> +
> +	if ((fp = fopen(status, "r")) == NULL) {
> +		_dprintf("Process is dead.\n");
> +		return;
> +	}
> +
> +	while (getline(&line, &len, fp) >= 0) {
> +		if (strlen(line) > 0) {
> +			if (line[strlen(line) - 1] == '\n')
> +				line[strlen(line)-1] = '\0';
> +			_dprintf("%li: %s\n", (long)pid, line);
> +		}
> +	}
> +	free(line);
> +	fclose(fp);
> +	return;
> +}
> +
>  /*
>   * Get a specific field out of /proc/$pid/status and return the portion after
>   * the colon in a new dynamically allocated string, or NULL if no field matches.
> diff --git a/libproc/rtld_db.c b/libproc/rtld_db.c
> index b6d33ce38425a..9eb63138326dc 100644
> --- a/libproc/rtld_db.c
> +++ b/libproc/rtld_db.c
> @@ -1771,7 +1771,7 @@ rd_loadobj_iter(rd_agent_t *rd, rl_iter_f *fun, void *state)
>  	if (rd->P->state == PS_DEAD) {
>  		*jmp_pad = old_exec_jmp;
>  
> -		_dprintf("%i: link map iteration failed: process is dead..\n",
> +		_dprintf("%i: link map iteration failed: process is dead.\n",
>  		    rd->P->pid);
>  		return RD_ERR;
>  	}
> diff --git a/test/unittest/usdt/tst.multitrace.sh b/test/unittest/usdt/tst.multitrace.sh
> index 4e53dbb992508..262c782821ef0 100755
> --- a/test/unittest/usdt/tst.multitrace.sh
> +++ b/test/unittest/usdt/tst.multitrace.sh
> @@ -73,7 +73,7 @@ if [ $? -ne 0 ]; then
>  fi
>  
>  script() {
> -	exec $dtrace $dt_flags -qws /dev/stdin $1 $2 $3 <<'EOF'
> +	exec $dtrace $dt_flags -qws /dev/stdin $1 $2 $3 2> debug.$3 <<'EOF'
>  	int fired[pid_t];
>  	int exited[pid_t];
>  
> @@ -142,13 +142,28 @@ DONE=$!
>  script $ONE $TWO 2 &
>  DTWO=$!
>  
> +dump_debug() {
> +    if [[ -n $DTRACE_DEBUG ]]; then
> +        echo "runtest DEBUG $(date +%s): Debug output of first dtrace so far, PID $DONE" >&2
> +        cat debug.1 >&2
> +
> +        echo "runtest DEBUG $(date +%s): Debug output of second dtrace so far, PID $DTWO" >&2
> +        cat debug.2 >&2
> +    fi
> +}
> +
>  if ! wait $DONE; then
> +    dump_debug
> +    echo "first dtrace exited nonzero at $(date +%s)" >&2
>      exit 1
>  fi
>  
>  if ! wait $DTWO; then
> +    dump_debug
> +    echo "second dtrace exited nonzero at $(date +%s)" >&2
>      exit 1
>  fi
> +dump_debug
>  
>  wait $ONE $TWO
>  
> -- 
> 2.47.1.279.g84c5f4e78e
> 
