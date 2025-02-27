Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5EA1B4140
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 16:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740674460; cv=fail; b=eIN03VJo729bRy4T20Kjjlos059zyciL21St0M6mJg/yLfdiOBqPt41C26Tyu24z+nCdxqrcSLMsNxnISqmaSFyblqpQYrvpF4n6a2rNFd8CID9itfLra02nGur6DJO/1L8unE73LHoz4osErQ49Q9jZGOyXQvT4qcPiD+EG5Fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740674460; c=relaxed/simple;
	bh=awhTJnPeGIQlZYJ/BYBapoSZJ6G8473i2JJk7vUiIFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MOUAaxMZbUI8ycIEDPLVojzaVc7FO+JSqzvAh/YcgMDGkehoCiuxMR0xxxgrTYuQIiatdLicfEwLz7S2ldlas7pwjWuRSx+A81+mrC3tPDxLHte0LbBluAfz9uEyaEQJAzFDRzM0u/pVRFuaQvSh5nYJb2Q+HJs4keq/xiodLMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AbpYd2RR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=i9MeJDK+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AbpYd2RR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="i9MeJDK+"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RGMihL006411
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 16:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=aqDd4CdxZCdVK5RCmT
	6jYEavV0PTY2gaybO8srGMgKQ=; b=AbpYd2RRcdY+KElLy9oPF9n1tQ0lDY2zfM
	zIdtQTJ2JBkJhTPnBmdqmqYCIAX7pl9BtZeDzHpHsLS9yT+DYh/NPx6He7A6YumE
	qKZb8W14qRMX5Uluu64iJFeAu4cTx0/tP5urS01dYcGPUszBA3871znS0+3i9RyH
	ks0pjYeGIatTMNRLQa9gLE6wRJMeUMCZX9ORuw9zLDnzxiLAuooz6c4oZXCggqFp
	wyD0W2RyjRAHI+oC9Cc3m5qcTKmB8oDs5riz5/NyXzM0UF23Q3r7YEK9n6vqCWN/
	0M2o91Hl2uUlfjIN84znuIA5HaaJbpiUPAku1ecPy2dd4y/OX6Fg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 451psf3qw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 16:40:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51RGE830012575
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 16:40:50 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44y51dku5n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 16:40:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xogq33tSNyiLkohXPMVINcndv5mrz9Z/8OvQFhsuxGpmx/PP2L0oKhOGg41pKVvXzPThJiIcrTKAQdrwKBtcnC0sw6OUVEUV9AoPuf25b437y7qUN41tti2+NTHgW+grJYNXFNHOzKwPrO+d4sbiyVMoQVOkdP0DCS0qykq9mSv93627lUbzdxeNXrRWrcrNZCJrqRsGr9inmp49O9y/+s3e3T8zWMVGYuWKtaYHXoi8KHU430TpkTgmpHed1rKfz5rmFZfZ2CzQsITnrg4wVP8oukmw+lpPu5YUVG1omcWIS8n93MdeESLvU3i+cUMZLZ8E8TyCmJmR2g1dRTMO4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqDd4CdxZCdVK5RCmT6jYEavV0PTY2gaybO8srGMgKQ=;
 b=evpsAluUv0PeteAj4ZLImaX+OsXiOa29JOph+cz1vhnut1vUyLqTYHNHGAMZ47jRq3dXGJRKXnyTZcMS0ZYBEmL6FRTuxnNylC6eVWof5vZ8ejXy8Gz3l0ZTRKwj3YEAGpu88/3p+MXW0S40KBIihiuWYUJq37gvqmHd2ofNJLj3pDVOz0vKG+AbCtEqlf9osRQbsb2Q3W2WmJtwFwu5AZGh7Y95oOCbm+mO/zffhVjmfW3/fGF77iVglVjuw+iD+/jVsoTay2UHijFmr3pxPIlB0WhwVmMX4zMmUUcxPxjdJeG5H7AwFziXXjtLs5Mv5KbS3M+5wDNK4dxdwTu6/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqDd4CdxZCdVK5RCmT6jYEavV0PTY2gaybO8srGMgKQ=;
 b=i9MeJDK+WaZiRLr2cs6C1/z+pxYHe+jgBKPzuTUpS7JfdcEd7IXHnhw+OtUNdvhjXgHGDsnCFviuSdH4ZPBifxWa8mPQgSXDD32TLqwqOZjl35gh+ldGV5lmNQ16t8+AxYKrkaf6zzoeaepb3ApyhoI/q6kAofUwpPn2qG0VgKg=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SN7PR10MB7075.namprd10.prod.outlook.com (2603:10b6:806:34f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 16:40:48 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8466.020; Thu, 27 Feb 2025
 16:40:48 +0000
Date: Thu, 27 Feb 2025 11:40:45 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/4] Eliminate DT_VERS_LATEST
Message-ID: <Z8CVjWt27pWGpPyG@oracle.com>
References: <20250208190622.23484-1-eugene.loh@oracle.com>
 <20250208190622.23484-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208190622.23484-2-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SN7PR10MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: ae9096f0-1a8f-497b-0558-08dd574d7cff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EUKFr7jVbriPWHr+rw7zBU0cKSgTEw2MNcx0Ifna1CvCe/rzg7M4kY1DTCrW?=
 =?us-ascii?Q?qmmKCiUGntuy3Gblsai0OvolQfEPhZmmyIZqEEI+pYosUtJ7MTMRIRz3bvJ2?=
 =?us-ascii?Q?KQGypRW4SsvKZ/ndhDxBWTrTkkZMFY74oUm8lwFf30A99Ec78eOwRVGf7fHy?=
 =?us-ascii?Q?R/9vMkTBBmklH34eLwC60PS9y9Uhz7Ac5bZ1istLboCcSAxUxtQvnPthm31K?=
 =?us-ascii?Q?Mlvn7hypTmTfVpL8jmrtO/0ZUOKv8y2WW+uuVKGDBwwu7QaYtCz6IYtdWXGF?=
 =?us-ascii?Q?VL6XllY+PHyY+C9x/zac6NbTrpJlx7QdurFAq3JPcxmT+DAXnzKGuuYjnYLW?=
 =?us-ascii?Q?OkLz/sFW8zoF/VJP6L8IT9JOoSsQeoIDR2cmMk0J86Pt7DOdHa/KBbpQgNJ6?=
 =?us-ascii?Q?7UnT5UPAkimOYPB38130Zlm+UKQLXREmYo3ho2HmkD+spwMCue1xz/9bSY8d?=
 =?us-ascii?Q?TRn54z/uSQmDIRIcZck7qXEwtai6BKkhmzOMbuAUN6Wk2SOMziH4FUnLayyI?=
 =?us-ascii?Q?hHc8WOAoFWjXkCVjIFqeEfmTFlAlNMCRNkKjfpR80yb3NNTHRAXZBMi8sh3p?=
 =?us-ascii?Q?5M9N2vchPYswO6QvfP9pYHJcFf9oe/kNGj26nGZ3bL3/vP44FDEnjjMxQwqv?=
 =?us-ascii?Q?K9wGSqlcGBuHqt4UB2k2cHVYHwkBsDAR6UIoIQN1E67M4ABS7PseszoZtNA8?=
 =?us-ascii?Q?x8eQ67g90R0Dzssxuu71kzYe/lf9CxZ4hv8hYWTvQ81U6I8QDFDFGIY4ZWCc?=
 =?us-ascii?Q?cpSnXRhvho/HcivyHWZFC8iUtbEhWwoRzwgysVe/au+OTpAHlZv+PH7gltMQ?=
 =?us-ascii?Q?oaKZAF3RjfLIrMhvh8E6lNPHZv35jrX/nyUHwBR28ix9s/+w5id+Gne6tv4/?=
 =?us-ascii?Q?voeyi/fOwRlVTaNZrIMKuYN3cW5BD0uc9HJFLH70Hpmm0+gkl0TKe3mxRq3B?=
 =?us-ascii?Q?we1jxwaW88ER1PQM0JSXJMDUtYbFmDYLwr7qTrcXeCqlGD3QAQ3HTHxNQGT9?=
 =?us-ascii?Q?QMnxfjTE7HdKbNRV/bp5B2ijdeeDbh7QWLa3tyClWEy73mJR+A2H6F0vrcfF?=
 =?us-ascii?Q?ycDbtr2v3m/O34Zl2D6SvI5eZGJBoWXieOGbNW3zDw0JIRdjoWrNP86HWOE8?=
 =?us-ascii?Q?rYN9FkoHDnx+REyPTeUS6DZQaK+A94hRUwA1jhbzOgIqU7l/a0WjMrMePYag?=
 =?us-ascii?Q?KuJ0apgAr1bIRDWXizKq2QQwyVTha5ci4xRGrZ5i6DE+vrJeZrAgHOQvc/6N?=
 =?us-ascii?Q?RMuZK68TEnvgTEQu61hcN5R4fXrCeufcYDEYZZUOXOwOCil7aNHet0rJ23eZ?=
 =?us-ascii?Q?Jc/PkS3wttPg/v1Ed/QKANwNukRMK+MSbJqEIp4mlQZw9TYqcj8D+NBRzS0Y?=
 =?us-ascii?Q?8j4BjZCQl863tpMUVZI/0LCar05Y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?60grDedyUQEwG6rsL7XlNAz5oZKSd9PK2SDCdu4/9FoXJwAsJJt2p2WzRUGV?=
 =?us-ascii?Q?3zLWejaN4wlO8aXXg45R00u6q0JliCHhDDI0iXrwR+SUzut/P3HriH4xeGMS?=
 =?us-ascii?Q?IwquHAC3Jhutk4uX2CwhJ71O95VXGPq1Nvo4HKYL7P68fY227Z/s27xpKyOH?=
 =?us-ascii?Q?66IhrTIhV3DtvrTakA8wTtbYtyN/OeSsb77qs6sLv0VsDl9I4BG4mo3B52Xk?=
 =?us-ascii?Q?XBv9NWu0Ij0IY98eq13BexpY0GdhjAkb4j+pnIM8W2Ztndna4mmll+WctjPs?=
 =?us-ascii?Q?MYP0oD4/ns15Rl7zVFMiPA/uOhKToUacHc6Edt+z3w8apnI0lG3mkA8aGYpQ?=
 =?us-ascii?Q?RpPbbsDuBKesx9cIC0mjbqbjtDWJweqLyGwg++bcNkx6wXc4+0Zl6JJ6io31?=
 =?us-ascii?Q?4ZGCxp4A/LjAhi12/gDStcwUk6qPf5dBxC+jIB31cdcXRvB14CYQHTSGCDRU?=
 =?us-ascii?Q?h0QAhqtPWhDqk9RxcjmnftxAluXfWM4wvvAAWHOxQPOIDqCGIfVjmlCwrS/j?=
 =?us-ascii?Q?DzlcrTEQq9b87n3y2UW2f9j7CJXFAHm9HKpo+qyBFbtr7sSJn+5nfBi0+iUY?=
 =?us-ascii?Q?wEFCyhp1grr2sRMC6goiOlF/K08UTQXtIlL2XwZDJ+vw46BHJ0NiBy3PxFiz?=
 =?us-ascii?Q?nx6MyOCFH3HGnkHgBPjHj65t2Hz2aWyRzy0WPlkuTOi6QlCZTPAflp7nzzyw?=
 =?us-ascii?Q?NBCuY0XaFZgJNuJXYqeRLyIQC3KJW0faCG4EA5llH90Pk3UWmKlYQ9HZ6P+o?=
 =?us-ascii?Q?RYHb4ujHVs+cmSjHamv7D9PdJRisHmgq60xzM9xDJuqegPUd9/6vedWxwLSw?=
 =?us-ascii?Q?Xq5Dc5YUPxJ8gc4C29no0P4T5nIjkSgoGhWKjg8JGWllZQaGx4ef1yMo7RYg?=
 =?us-ascii?Q?tPCupByzjgo4XnMqVaPQ61bqTXoByFpAZcX7K/6IrSD5TTns4KLCsZ7SZzmj?=
 =?us-ascii?Q?3WAEAmXu204m5SKJrUGMXut/Eogv41LsiA+HFdmVDYp9fcpk97KN6+zXE3Vo?=
 =?us-ascii?Q?AXyOnnXeyz2IRf7vwLdDXgeRJmB8h/5qtlWVR7s1W2mM/kO4f29JRcj5QCW5?=
 =?us-ascii?Q?SMD0CwSVRKU+7GIHG40v6aT6s9aS1JJSMT9Qv1lqgJZRsRi7bqvirYecgq/d?=
 =?us-ascii?Q?FtmTAkJEaKFAMCGe0XBO68Kyrb6NB+8ydlIAZulcYGgMWuWNLHVRQoj/S5RE?=
 =?us-ascii?Q?hWhSiFCsygu87xba6Qj8QAVilyTKRWD92jQPnUK7gmg7EdNu9gVeyI37OYHP?=
 =?us-ascii?Q?thkErQsG5UtbJduCitxxlQSm722pLoTqLB63Qc1Y4bc9y1p5l7OjgTv5/51H?=
 =?us-ascii?Q?xRgtehEL9A1sH/D8QEsytXWH+3ZhF3jOloPXaZfjbt8v5XQOmJd8AK0rPJJy?=
 =?us-ascii?Q?NFPTilR092hoBUwmfO+novWYb2f9mVZcMzYZnpmlHoPHQeyfcGaEynhQYZbq?=
 =?us-ascii?Q?/mmZkmGzRlS8S859zvxLmjG+mz2u4IgVlE1GxZ3GEb+vwF8DbjxWH/WG9xDN?=
 =?us-ascii?Q?am7qRtLbzcdhSfHPyKfIfZ1zmRgsUb8USw7I1TSgmKTtd/nZMSRp1hSrwqGT?=
 =?us-ascii?Q?Q2d9Q9uxhT5EF7Kfq/QXQ0OMbKVwE7RySqri9PLo3U+VO68rp1ZYTQYJB38u?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	h+OzRiB2ySU+XdN2Y07G1R8ou0lwcDamY7QOm8cedKAJT3M13ruQzo2EPCOeAI1BW1ThxZnDj3isqjIwyRhbLFgqKybNAJiab+J+9geYHP1wYpKCnbR4jfiHKxc8CtOJmPJLemd44GMpeYnltoGpgXkx9QbABK4b0cn/rdvF9hIrM+bTHyieJKsid4UUmu4LqXrpleRMcVQlPQkFpI6e4fdakDpzLyosE+Xf4gePOpgofzFZl4qnORtMFk6/pteIFKbu+EIezQFMgB18ugjEuWZ7Yy4OkwbkC+JBNPTlHBzzn9OuYyR9FJMeE/mc/smg2osd5ikmdvuofVGZxf6cxmv1d3h62x9yoKTmos5KEap5LdwITgnPqABaxcaufCVMj7WzJ/xdkLnzyQRg/UT9z4UF0S1YdrO+lkaaUvSu31r+6t0sM4irFf2GtJh5u7IudUu8cMBaTCFsZwaPEnGluW4ArCQDWTJHoYdwAIdzTifoCSx1XBFvHv44WtLyy9cLUi4zMiRXqG49F2S3YiV7RUO6MfzSjbFA8ZckJCghXnOnTZ+1XcbZxaRWCf1FOhuOLNUh0clul4ypVn1843/y1T988JR4O10hZFA+4OmATmw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9096f0-1a8f-497b-0558-08dd574d7cff
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 16:40:48.0172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ovd4uaT/250aeX61j4wCEwp5eQ0Mn33eMML9pX/tONz/yxCCK2eb0N4d1dL60lxdllsg/LTxQCgpgdlA1vyt8sawa4sDgqaVf26sZ5iGQWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7075
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_06,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2502270125
X-Proofpoint-ORIG-GUID: iDLFz5ros8buslBx637qDdd9YYdkj84e
X-Proofpoint-GUID: iDLFz5ros8buslBx637qDdd9YYdkj84e

On Sat, Feb 08, 2025 at 02:06:20PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Updating the DTrace version number requires too many distinct
> changes.  Eliminate DT_VERS_LATEST, since it can be determined
> on the fly.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_open.c    |  3 ++-
>  libdtrace/dt_version.h | 14 +++++---------
>  2 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index a02058871..b4d160359 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -721,7 +721,8 @@ dt_vopen(int version, int flags, int *errp,
>  	dtp->dt_proc_fd = eventfd(0, EFD_CLOEXEC | EFD_NONBLOCK);
>  	if (dt_aggregate_init(dtp) == -1)
>  		return set_open_errno(dtp, errp, dtrace_errno(dtp));
> -	dtp->dt_vmax = DT_VERS_LATEST;
> +	for (i = 0; _dtrace_versions[i] != 0; i++)
> +		dtp->dt_vmax = _dtrace_versions[i];

dtp->dt_vmax = _dtrace_versions[ARRAY_SIZE(_dtrace_versions) - 2];

(-2 to account for the 0 sentinel value)

But this will only be accurate if you also add 2.0.1 to the _dtrace_versions
array, and then you should probably add 2.0.2 to it also for accuracy.

>  	dtp->dt_cpp_path = strdup(_dtrace_defcpp);
>  	dtp->dt_cpp_argv = malloc(sizeof(char *));
>  	dtp->dt_cpp_argc = 1;
> diff --git a/libdtrace/dt_version.h b/libdtrace/dt_version.h
> index 3fd1b3d1e..bef3243e9 100644
> --- a/libdtrace/dt_version.h
> +++ b/libdtrace/dt_version.h
> @@ -38,18 +38,15 @@ extern "C" {
>   *
>   * These #defines are used in identifier tables to fill in the version fields
>   * associated with each identifier.  The DT_VERS_* macros declare the encoded
> - * integer values of all versions used so far.  DT_VERS_LATEST must correspond
> - * to the latest version value among all versions exported by the D compiler.
> - * DT_VERS_STRING must be an ASCII string that contains DT_VERS_LATEST within
> - * it along with any suffixes (e.g. Beta).
> + * integer values of all versions used so far.  DT_VERS_STRING must be an ASCII
> + * string that contains the latest version within it along with any suffixes
> + * (e.g. Beta).  You must update DT_VERS_STRING when adding a new version,
> + * and then add the new version to the _dtrace_versions[] array declared in
> + * dt_open.c.
>   *
>   * Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
>   * explanation of these DTrace features and their values.
>   *
> - * You must update DT_VERS_LATEST and DT_VERS_STRING when adding a new version,
> - * and then add the new version to the _dtrace_versions[] array declared in
> - * dt_open.c..
> - *
>   * NOTE: Although the DTrace versioning scheme supports the labeling and
>   *       introduction of incompatible changes (e.g. dropping an interface in a
>   *       major release), the libdtrace code does not currently support this.
> @@ -85,7 +82,6 @@ extern "C" {
>  #define	DT_VERS_2_0	DT_VERSION_NUMBER(2, 0, 0)
>  #define	DT_VERS_2_0_1	DT_VERSION_NUMBER(2, 0, 1)
>  
> -#define	DT_VERS_LATEST	DT_VERS_2_0_1
>  #define	DT_VERS_STRING	"Oracle D 2.0"

You should add 2.0.2 and update the DT_VERS_STRING also.

>  
>  #ifdef  __cplusplus
> -- 
> 2.43.5
> 
