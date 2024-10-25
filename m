Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF04215C78
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 19:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729883751; cv=fail; b=ZWzjTsi0fIXDbPkv5/CGk6/xcUNkE6cuSo81F7oW6mhV4eUojb/jtaITRRPx27NCZofPXKPUBq2vWnZeCkNquZoPuXElZSmhY+59IX9wlJcvIjufPnKx8a2Srydr6H7ED2p01xRJIVBWalG1RCjKp80WsnGeotMcJOwhg8vS/Kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729883751; c=relaxed/simple;
	bh=xtlMW2np4akccFSo4Oilv4+HEgDWKImd189AFQd5ASI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YwJIX5pBThKQsz+0a+gvTOmFS6qB9hRSTCjYSenCdJ6Y/i6vxHp+jwmzNNmfeUhn5OjOkQPGq/B0XPVn/wuX28gLpr4NYbkH48IwxHCfuJug0hNGWnMMNFLdCz0iw2MdvrHQdy25D+afc0VjBxgjuycsZCII2xiVl7tsRpkUweU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ivXx+SVd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=INJ5nmZB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ivXx+SVd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="INJ5nmZB"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PG0XfK031997
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 19:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=axvHDWuIYICiF7Lrhu
	TeeMpJJFR/A0ydhcLNrzsGLIA=; b=ivXx+SVdGACvlhy261/gz4uW5djQF3cmoi
	xXVJJit6dS/8mEV+XBZIfohhRQSIZQs8Ee4UIJBOZn1i9qN077Ohzdy2QdV5jogI
	kLfUxPuBg4GPPY3SiZttm6nAJHM1WBrT/9h26Vb1mMxd4EqMYyhACDlSLTJq9iLl
	GEuYEYYGu2Hw9Xz/Nn5FeUxMXu/294jk+yAUIvCLorpF6xaOs5iV135oTZJPagB6
	RkOV+PvrQuM9/lJmqQJpRXnsNRCGF2O+U1m0zKhHOgagGYAR5IoY0poOLcOeC6gB
	cvIjBygKPEBk+tr9aOoU3WIF2MsfGyKPLGuoz/5sV7DJb90bDzkA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55v5qyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 19:15:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49PHoO4v008573
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 19:15:45 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42g36avs9m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 19:15:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+QCz88DMKZadiz804dTWEgfCDL/XYpN1LCfTFy/RvfGgzKTSoCRbTmxabFjJIl+nwOf4QkKCItZFJUvgsrleSdUYeqZHfUWGbBSTS9S+hmQrfVnsaIZRvxiTb0OTeZhSVCqyrYZKCIdjVKlw1AyfCeAAsZJZGdCNFC62BseGTl4tgzpVny/NA3UdhLp9f+vBKq+vKCctIt/52LzN/FVf+fRoxXWPjPMjIrXJil7N/elFHxHgprOJoyD4/f0CEz16dSlXHiSe0LEf4KwPeU5YqTv1gIrHeK5u1eVusvDAqpiUDA3D7gKJJLz6Qwp8SHdYDyQvup/S/V5jjNI0/oiWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axvHDWuIYICiF7LrhuTeeMpJJFR/A0ydhcLNrzsGLIA=;
 b=ihMnV3C13JCRo+aUXP5xhWU9Ia0z+d2P4U0A4mf4UGlTD2nVq0wEv5X/RaCedOk0UqwD51OWQE40RoUPaSX/0ASOqNi/+I1aQN2ViUbiSqDjVejakE0OvOKIWMB5ID1B7oVQbX6P0M+nP8hDSZja/yuRFWIgDindUUTY3kkTN/slLO+sPqhR9TesF3FfurfCPF/t8zoIiXZGSXrDWU4amR29ZFmszj97DR3pr2OkDGki/5KwBqrkcZ2zXafsKXspw6vMMTC/k6sW2jsdyqQUqX65YzGthqCBqKMzRZFDn7XXJiUlFjcYN2PDFwCc67rQtS/9gDwXm+FbiUTFwGpIzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axvHDWuIYICiF7LrhuTeeMpJJFR/A0ydhcLNrzsGLIA=;
 b=INJ5nmZB/23mcNznEJP286W0/tvtn4Fo0DaPWIcHUSotp3riJ4q5QD6vM9lIxmSrKDIsjU/hZAb8JjNKesLwUljxZ2PklbyqaoykEcQDufhnU4ySOtYXv9EEAqAA4ZKJP9phhTo4+9E7Bfyc/vw1PVX4SjoQ4QJ2bNNlE8B+04o=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SA1PR10MB5886.namprd10.prod.outlook.com (2603:10b6:806:232::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Fri, 25 Oct
 2024 19:15:41 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.021; Fri, 25 Oct 2024
 19:15:41 +0000
Date: Fri, 25 Oct 2024 15:15:38 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 4/6] cg: add argument remapping in the trampoline
Message-ID: <ZxvuWjuWbfweZmgj@oracle.com>
References: <20241018195808.270688-1-nick.alcock@oracle.com>
 <20241018195808.270688-5-nick.alcock@oracle.com>
 <ZxfkWjbS1c0vXLvn@oracle.com>
 <87plnorxat.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87plnorxat.fsf@esperi.org.uk>
X-ClientProxiedBy: BYAPR07CA0102.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::43) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SA1PR10MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: 78f126e9-d61c-4145-baf9-08dcf5296ab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3U9ZF/uGn50G3wvDcy/CmY9ljNAtNLXpch6sBglnl8W8ZUaDyIC0g9ip5yOE?=
 =?us-ascii?Q?Dek1cV8LSNTYK3VkfaH3iCigYw6Dhm2DYl0GSaOOdOcQS32THI+fu1MMjy1c?=
 =?us-ascii?Q?FDFSoPUYz1lvq0X8zCXv+Law1hy1Fc89sgLg4M5jwQHDq4XXsbZHvQdau2JW?=
 =?us-ascii?Q?8gFFykfnHBrSvwKhdcAoaaJeM1hp1CoLYvvgfCjLXBU7s1+6wtoQSrlptGvx?=
 =?us-ascii?Q?Wdv2BNXdAGmR3p2WiwoCkNLzrxvKMY+6WUoLbqyBJC5uToTwAn4WRfLudIvW?=
 =?us-ascii?Q?LlsUKGxoHdsVk8Bo52tGq0A9mKCmIjEN6JvtHMK5NsWn8AG2pDvI3JoAyQcl?=
 =?us-ascii?Q?OOzQsLM69N06XXnMTyHVcUt4pbozk6PIJbCMk66Dwv5r7Cv7LnM70yQyrPZD?=
 =?us-ascii?Q?pXZlQv6WddzJY5yWKZt8lKfRoh0IrG6GgjPZrSodQaw0PqqUsQtCuY7bdp3f?=
 =?us-ascii?Q?cCPRT9eQZ2LhFzXezZSnYCb0W7PxFtfe10jcbDaqe4kbjywIKk/oxr4mE9mP?=
 =?us-ascii?Q?mugMwRoj9gHqIG/T+DmzleO8nU/xu/Cm3TLje+IpvMAVNp7urO6UabKY1HKV?=
 =?us-ascii?Q?DyXxQYfq+brhRO676V2uea1HlkkrqC3KFMx/1RUK4rPsQcdOk+Ywc9N/JzR0?=
 =?us-ascii?Q?dn+MfKQNw4hwZdaC+KpRXnX90QeOP/ZqTrcsh8e2C1yoZV6NAwGXlrb+/tAN?=
 =?us-ascii?Q?vO3ZB9vNsZdkAX8SZ/13szbKYKs7Q9z75JZCdf2cOWcffrCX5fRcmVGj7zkP?=
 =?us-ascii?Q?3Qj9SKGOoLLTfBJO/9h9IgUpEuHNrD7lAN9JOGHhIx4IL5MJR7M+AlPpDd+T?=
 =?us-ascii?Q?XJJJGk/LouprGjnpxIXOWGPPUfqf3KJ4PelULZ8AWmlL3OSXTP+7GIVlvBPH?=
 =?us-ascii?Q?9ttR4ldZCeP2A4zzHqonLLTztkKQx7ftNsg8RQHFB6mnGJ/IZphBKl1ZWp5R?=
 =?us-ascii?Q?UgcRUIFJdH+sk8swgTUJyx2IkuJllDViPS9d1nm8BsRXODEEKb54ro9W4qv1?=
 =?us-ascii?Q?2ejXYs349DFYYdJL54tPD1fABFa+5o0fOhonBVCL6daOa3tQfhwDntfQU2U4?=
 =?us-ascii?Q?1f+YTfg4EEB313xss4meJn1eCJydiMaCLOaG3j4IEwgRxYlpkzvYk54qfuyt?=
 =?us-ascii?Q?Eqmt+YwHFM3kmz5oQ72tkoRn3QQYfiRLp5p4AGnKOiCMOC3xiNgPMhag8S6N?=
 =?us-ascii?Q?za2KGdMM3zKzkwULmpbgg9b82oPqRrPKMyLBoNBc9zwNJj0PnKTQu0dgdRbK?=
 =?us-ascii?Q?1K7rnyGvmsNmWEpmJYPu9VwwmIJPDZSL5AgMYraToJTKgCxTV0uAqIY1USyT?=
 =?us-ascii?Q?+0/82Qxxvj8s7erYKiXB2RE5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TDph8bazNa+PS7Oh84GqXeK7udHDCngExoD56sKCWkf1MK89ec1n/mqr9AUx?=
 =?us-ascii?Q?ga719xsLnq+8xwBxpzKoc7LxeoS2yCARVSIFCWX2eJqZ/cCTSFaqlvfJ+OJi?=
 =?us-ascii?Q?OTYj64K66d7/fiTp4MJM8F7PJ9+W1LBlxULuNtTm86x6KttUGsuil1GtnGPp?=
 =?us-ascii?Q?seZrg3Gso20JBddDlimIj330MPvM3l6K0sr9ulvgPu5oXEvjrhqMsMCEvR5D?=
 =?us-ascii?Q?fIBoTwMxXzn/CaPmd7l4azVbPwwZzFHxKYaswHSpqDbR/INRqfCgAuNYG5rP?=
 =?us-ascii?Q?9A/9vY2coX9S9EDXn6C0xwH9RfD7682QpmfbohSqMgHVBgz6tasT612Kv1UY?=
 =?us-ascii?Q?rWW1/jjfk37dhHU2wcbkvCc0+bRpmGzXwC6LDrSz3KyXtg7TSN1PEa2gdnU1?=
 =?us-ascii?Q?XG8BqW0cy4Ecv2uggUlbRVzR/JNzmzigbJYARgX09FqoJhwVk+OzO/FPTOiL?=
 =?us-ascii?Q?7yNRpVZ1/DsUpGLaFeZBzOPahX4pk3eAbhlnRc+UieUetrYTWHtjH33qldxj?=
 =?us-ascii?Q?d+2Um+R+HAbUGWBToETpcx/UBWcyHc44YSjvlKPFEfGzs1z+iVX1WdbFIriw?=
 =?us-ascii?Q?ceIM2WmOxSz5rH602EfHBwIJvgQ/gU7/XKkPWgpP5sFyRA9cFrNkzpCAPgnl?=
 =?us-ascii?Q?M15oe7MPZbg8rvtDHXAk11lP+adud3Xjq8f2yFrsw2leJNllwVm5s8q7e1tB?=
 =?us-ascii?Q?0qfDIN9hLcO30NgzopwRXD1GAiygCY53xuxYOT6M/FsGPB40EUx8V/eGawSb?=
 =?us-ascii?Q?lhutZ0aHx0X9tCPSlkjc+5n4Fv/TMzi0phxx1ebZy9/kATzPTHW4UEaguRHR?=
 =?us-ascii?Q?lpfwf8w8shDvlhM8cWJTrU4ZnxVDqCxbOKmrbrssIzc2sacoj441Mw/T54ro?=
 =?us-ascii?Q?K+5LfZRW7w7mtUlNN/L3pX2L9BW+yLyw+PBUh+spztlvtqzw8gOtFcy+mtH8?=
 =?us-ascii?Q?pEyLjIuAxo17ygry0BiSYMdtv3Kg+0LotmAR0lvVOwD0D9eU9quQyvhPOCHu?=
 =?us-ascii?Q?1eyCkiZOgdNHbIveNGvimO+YNTi/NyaW1Y0tZNE4uC37OPjpfz2wqLmqTW99?=
 =?us-ascii?Q?WyEP237peYVEgqvfHKXV9pcfEAW8JsXf8UstLH0WF2SJU2u9HUpwk1JPpz4o?=
 =?us-ascii?Q?O5D6Tl6wfpdZW6IquFKVOcjw0tmH8LcLZvpnJbHaCERzd5E8o4pBX3751mtD?=
 =?us-ascii?Q?0CqFwtI8WS4e06aSwPxFJvhDPRDeFq5ksgKh+B4dMFcmPtTSqpEvXJeHCkW6?=
 =?us-ascii?Q?7/B73KOwdW/qeQIwGrUq1NTEwZ/YaWbIAjE22lfUwJQaBEGm0lVdy2nNmRTw?=
 =?us-ascii?Q?dbJvdo38vZPmwJQg56G2TfqyVUC9/brTuvzKJek0w+HkvPP4l2cT5TzkoOsi?=
 =?us-ascii?Q?5moZBBGYRZw6SUKPVhVZNCzSJvboTwoE2CkaqqfE/Ckbw9ZqL2RI3cI5gEr7?=
 =?us-ascii?Q?dizEcLfbGMvOFgc4e88uC0apYAfdzRIpnAKexbpir2Gt25KpJrvlp2aCMkuK?=
 =?us-ascii?Q?raZd1H7QyL0tlL0s4LZDi9lBRe6M/V2d46t2z0j7VRXLETuXNFidvl1ySKw3?=
 =?us-ascii?Q?KfhvO/5OgM7VKnkWEW3eRBlUG1cuVErVjHQG7UvLgDRfotodeF3U4VSe/GIi?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ftEP94KC3cAxFZRqedQONCr6CQ0ROZAC2KWlATaxJ2iN/jr3t3OTnN7XQZrUUTapRVHTmdQyPtvC3q1JypQ4FvRGqvtE9ZfnwK8pXW6S64bxTVJHZhWJWM2AJLOTTymOp4eQVhTIk8WhAl1tFA0NuhRbzThFAYpcbCMscMGjw69+IVXIVEKzPg1tkqFpa5clCAEP7ghThzOU1Ds7QlR5HOoYZ2N5R47BJy2TmfDqw1GToFJ35h9aXbv0vblwahTHyHcQPhNNTj5d9hhUkR5sSRTwgBz419BB9H481jcFw7KS7+pC/rbdqvnAVMCscbBDFq/iOuJO1uttkBxdRdC03pMvUiHvz4wTVpsGZ9vKI/dAHCiCMKNtE4MktN2j3j9CM4kIVZ1/Bz06+2x7dIuAWeNBMRPE2yV8SYaO1hLEr15gcwaUycOJqRzy39Swlk2AumZgyzJiJ6X+jI1ztGea5pxRXIugniKChxgckWJzi9gwOmY+LQjXPMURsx82ofXplmY5tKWoAz/N2f2pvm/9LK/+oihsY9II3oxHDGf8C/PE18M7PYcmFrnxXgXuboeUBsEXRNdPBp7N3Fi2QU6v8BonAQMz9bcXscZVz3pfO5w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f126e9-d61c-4145-baf9-08dcf5296ab9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 19:15:41.6797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2A1rw/tqPonQX/zYJ9xOMMf/IRbklRx/HXsfehptsRjqQDd8oGo7Od1JWEa3/3Q8vI/dwUKFuWsPxnSM+2YgG+bzox2VWSItTVvXjOWeI9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5886
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_14,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250147
X-Proofpoint-GUID: 6zktXvZSL7nV_8UoEJ2-cxyPZloefRji
X-Proofpoint-ORIG-GUID: 6zktXvZSL7nV_8UoEJ2-cxyPZloefRji

On Fri, Oct 25, 2024 at 04:56:26PM +0100, Nick Alcock wrote:
> On 22 Oct 2024, Kris Van Hees uttered the following:
> 
> > On Fri, Oct 18, 2024 at 08:58:06PM +0100, Nick Alcock wrote:
> >> Before now, argument remapping was restricted to the args[] array, and was
> >> implemented in dt_cg_array_op in the same place where we decide whether
> >> to automatically copyin() userspace strings.
> >
> > remapping -> mapping (everywhere in this patch, and similarly, remap -> map)
> 
> Ack. I do hope none of the mapping code ever has to deal with BPF maps
> for any reason or this will get *immensely* confusing.

Not really, because we never refer to 'mapping' when talking about BPF maps :)

> >> But existing DTrace testcases suggest that remapping is also applied to argN
> >> for USDT, and it would definitely be more *convenient* if it were (so that
> >> argN and arg[N] always contain the same content, and only their types
> >> differ).  Add a new function dt_cg_tramp_remap_args(), which can be
> >> called from trampolines to apply remappings (destructively, but it keeps a
> >> copy of the old args in the save area so you can unapply them if you need
> >> to).  No existing providers do any remapping, so this is not yet called, but
> >> it's about to be.
> >
> > I think that the preceding paragraph makes some wild assumptions that are not
> > really in line with what the anticipated behaviour is.  For one, there is only
> > a single existing DTrace testcase that involves argument mapping, and it is
> > uncertain whether that reflects a conscious design decision.  It is certainly
> > not consistent with the SDT implementation where argN reflects native values
> > and args[] is to be used for translated arguments.
> 
> Did the prior SDT implementation do that? My admittedly fading memory
> said that args[] was unremapped even there. I thought this argN
> is-is-nonremapped approach was something *you* thought up for DTrace
> v2 SDT... but I could be wrong.

SDT has distinct different interpretation of argN vs args[N] (raw arguments,
i.e. literal arguments passed to the probe vs documented, potentially
translated/mapped probe arguments).

> > The documentation states:
> >
> >   args[]
> >   The typed arguments, if any, to the current probe. The args[] array is
> >   accessed using an integer index, but each element is defined to be the type
> >   corresponding to the given probe argument. For information about any typed
> >   arguments, use dtrace -l with the verbose option -v and check Argument Types.
> >
> >   int64_t arg0, ..., arg9
> >
> >   The first ten input arguments to a probe, represented as raw 64-bit integers.
> >   Values are meaningful only for arguments defined for the current probe.
> 
> ... this doesn't really say anything one way or the other.

It actually does...  "The first ten INPUT arguments to a probe."

> > Now, granted, this is a bit vague and does not entirely apply to SDT probes
> > because there we actually have types for probe arguments anyway.  But I think
> > a valid case can be made for argN to *always* be a raw 64-bit integer value
> > (which you could explicitly cast to the type it really is) and to *always* be
> > the raw arguments of the probe, i.e. what traditionally was passed as the
> > argument to the dtrace_probe() function.  That would correspond to the native
> > arguments for SDT and USDT.
> 
> I think a valid case can be made that you can always get to the untyped
> equivalent of a mapped arg by just casting args[N] to uintptr_t, and
> thus having args[N] be unmapped as well does give you access to
> something you never could before. But that hardly makes what I said in
> this commit message a "wild assumption", for goodness' sake. The
> allegedly conclusive documentation you cite is nothing of the kind!
> (However, what sdt is doing now does seem better in general.)

> > Anyway, rather than making assumptions on what would be better or implying
> > that there is sufficient evidence for one versus the other implementation,
> > you should simply document that a test in the testsuite implies that the
> > expectation is that argNM and args[N] are the same for USDT probes, and that
> > you are adding a function to do apply this mapping, for use in trampoline code.
> 
> Sure!
> 
> > I also disagree that the function performs the saving of arguments itself.
> > I think that the caller ought to take care of that, because the caller has a
> > much better idea about when/if to save arguments, and when/if to restore them.
> 
> Well, the reshuffling is *done* by saving arguments and then copying
> them out of the saved orig_arg area into the args area, so either it
> does the saving itself, or it silently malfunctions if the caller
> doesn't save, or it reimplements all the saving infrastructure for no
> other reason than to use a *different name* so the caller can save.
> 
> The latter two options seem, well, entirely terrible, so I went the
> former route.

The way this has been implemented already for SDT and the design behind that
is that the underlying probe saves arguments before overlying probes do
anything with them.  The reshuffling is only one of the things that might
get done to arguments, and since there may be multiple overlying probes that
have different arguments, the caller needs to preserve the arguments it was
given in case any of the overlying ones changes them.

> >> The remapping info is still propagated up out of per-provider state so that
> >> the parser can use it to tell what types the remapped arguments are and
> >> to apply array-op remapping: users of dt_cg_tramp_remap_args() should set
> >> the probe remapping to 1:1 and shuffle the native types correspondingly,
> >> to match what dt_cg_tramp_remap_args() has done (in effect, calling it has
> >> moved the native types around).
> >
> > I would drop this paragraph.  It is unnecessary and speculative at best about
> > what other code should or should not do.
> 
> Hardly. It's documentation about how other code can get the arg types
> right if they are using dt_cg_tramp_remap_args(). Would you prefer I
> leave this entirely undescribed?! I could put it in a comment above
> dt_cg_tramp_remap_args() (or rather the renamed dt_cg_tramp_map_args())
> instead.
> 
> (Shifted into a comment, for now.)

But that is not relevant to this patch, and other code shouldn't be doing this
because it is almost certainly wrong that USDT is remapping the arguments in
the trampoline because of the argN vs args[N] thng discussed above.

So, let's not add comments or commit message info that might point people to
do the wrong thing.

> > However, I think it might be a good idea to have this function actually rewrite
> > the mapping data to become a pure i -> i mapping.
> 
> Can we guarantee that trampoline() is only ever invoked once, and that
> it's invoked after probe_info is called? If it changes the remapping
> array, any subsequent invocation will do the wrong thing. If it's
> invoked before probe_info, it becomes impossible for probe_info to
> adjust the xlated types appropriately.
> 
> This all seems like way too much coupling to me. At least done
> this way trampoline() is idempotent and doesn't depend on being called
> in the right (undocumented) order wrt probe_info.

If the actual probe arguments (argN) are being reshuffled (which is what you
are doing by shuffling the arguments in the trampoline), then the mapping
needs to be updated to become an identity mapping i -> i).  Otherwise there
could be other code at some point that tries to apply the argument mapping
and that would be really bad.

> (Or are you suggesting that dt_cg_tramp_map_args(), or its trampoline()
> caller, shuffle the xargs too?! This seems even *further* from anything
> a trampoline() function should do to me.)

Why would xargs ever be shuffled?  There is nothing in DTrace that does that.

> >> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> >> ---
> >>  libdtrace/dt_cg.c | 35 ++++++++++++++++++++++++++++++++++-
> >>  libdtrace/dt_cg.h |  1 +
> >>  2 files changed, 35 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> >> index 39c27ab0ec0b..9709667d97fb 100644
> >> --- a/libdtrace/dt_cg.c
> >> +++ b/libdtrace/dt_cg.c
> >> @@ -831,6 +831,34 @@ dt_cg_tramp_restore_args(dt_pcb_t *pcb)
> >>  	}
> >>  }
> >>  
> >> +/*
> >> + * Remap arguments according to the array of remappings given.  The original
> >
> > Remap -> Map
> > remapping -> mapping
> 
> Done.
> 
> >> + * arguments are overwritten (but saved).
> >
> > Caller should save.
> 
> As far as I can see this is not implementable without massive disruptive
> ugly (or at least pointlessly duplicative) changes, see above. It
> doesn't seem to buy us anything, either.

How so?  Just put the dt_cg_tramp_save_args() call in the trampoline right
before you call dt_cg_tramp_map_args().  How is that a massive disruptive ugly
change?

> >> +
> >> +	for (i = 0; i < nremappings; i++) {
> >> +		if (remappings[i] != i) {
> >> +			dt_dprintf("Remap: loading from %i, storing to %i\n", remappings[i], i);
> >
> > I would remove this debugging statement.  We don't really report debugging data
> > at this level anywhere else, really.
> 
> Oops, didn't mean to leave that in.
> 
> >> +			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ORIG_ARG(remappings[i])));
> >> +			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
> >
> > I would add:
> > 			argmap[i] = i;
> > to convert the mapping into a pure i -> i mapping, so no other code will apply
> > argument mapping again.
> 
> I think not: see above.

I think so, above also :)
