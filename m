Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24539199248
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 14:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729608060; cv=fail; b=FpWNSe7HsZC8S0t42doXYXHXUTMHtNbEKiCpf6ilmFJ1bhUTVOBSLgX31DEwDsUuvutV1HlP8+F/12nLbJ6FurgHGxzbmsZ6QxueO5je2zBGnfwRdDQwqCu7iWwEZEMGtneQ/MTB/QyTEGlALN5PC8m582HYAVQSU9hrUzNZrWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729608060; c=relaxed/simple;
	bh=LGH74cbSu+6CCmLtX5dkyaY2/Gj1fvHD2VFmZxsW6pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Fdv72wcuUeh5/WpNNIsYaXrX9yBkkVPmIv0a2lC/jBgTrG5VxGGBUmVfELULuKD6yrdBRLhbx9V+8EWZVrej5k2ps6CNscJyi5tR9U7GBt0fSrv1kScLnJcsFG6wrljE9QrUh8gcJ2sfjY3pGhe6wBhX63nsZIRi4VcymB4mbd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LzkdLdMo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=S831tblS; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LzkdLdMo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="S831tblS"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MEbJg1020286
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 14:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=gDM8aM70bzEbqs7kBS
	6V9/s+S3UvHQLP0qWYoUir3wE=; b=LzkdLdMoKmPvH0mS1f9G+WFH/eaTPt8W6J
	94d3J1KT8846nDUPSii19YDt77ZebVSATuLAlOcCj4boQk14wXtCKWJNZrhNAyV6
	VxFrY9R9s3wsi5D5XyszJtpmxM5vQqiaTtN69JZFbFU34AMF1IVIdpeSckwzqu1s
	WxbGPw80F9KgIrOF5FTff1v6x9bzUXuAno0z6JHKro3g5y87RWGrnZSyiZs85dK1
	niy6LV775bSob7Y+WFQLZr1QNnYy2w4/96hTmzrrVrO00b6ZVRPOmvFM/nT8sm09
	uc4p9MGb1TvA1dQNeg6PXzfAqxPlggol1KYEdceymCAuJoCmtrqA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42cqv3cx7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 14:40:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49MDOhum007662
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 14:40:41 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42c377s4e5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 14:40:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VadmWVRbfX33m62muQ/N3Q5GruamIfhF5yZOMUnrPSpZQ+u9Aup1ehnTlXCoUhhxL/j8gFTT7Di6B1aoUirvJk0MkaZJLvRaK9jYlDFJrsh14aKs+NLLLNy7tBAhX7HSwm6IvBnEZBl90ImeG1jyd9H3BWAnjcbQLZbIQS5YQsjBZPEM1tSAMyFUgB0sHQPth3he8JLjft/r1AzZ4vdLnls549u07ujGcdp55jRk4Ik9XS+FHUpOAH/eQ/inSWN0N1tIS8YxOozrCmYqITbSNIXEwTsqp2O5pqdQB81bGuVhzW2RqwllgK3RKYbt5Zxk/tJRLGXYUae6f/5c4rP59g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDM8aM70bzEbqs7kBS6V9/s+S3UvHQLP0qWYoUir3wE=;
 b=Ct0syVUHqdxxU0fbotRdPheVfma02Id3B+QTql3UOiQmmjnapy4uVJa9vQQ13byhIa2SirbIkOSYwoi9lASSvpCWZcC7Lk5Bx/UEO9jDphwiYSKR0h28W3KEQ3F2xROZBXs45upG8WhQC13NX8Lew5kS4zzfU9oXmNMHOrlP6tLM3VbmC/huiqTN4JmD7kdf5jEh1xRWBrWoEp392lR4Wr0V0alNkps6N0bKkgXJfani+BOLxizW41Cu1IDANw/oaY4xbV7F8lesGorQz0jWXMdG5zN+wAtSfOifr0SBtQaXTytg9vGlAcL2AqSJRggt7TvC/DPe1NErDlk2waJ9MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDM8aM70bzEbqs7kBS6V9/s+S3UvHQLP0qWYoUir3wE=;
 b=S831tblSzjmsSntyTXmtPXbkgfzmqFbW6rpK0o1NmUrnWFSxE2o9wPvkvdD7nzE+25JteekopVVZUKgTvI+pNxXi1B5lRTXUn2HpU9eSJDW1DdRO18HmwcfJcSwvGdCchJDe0ZfdMztM4y1qwAfdm4EglHjK8UzU7TzQfdFF1dc=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SJ0PR10MB5857.namprd10.prod.outlook.com (2603:10b6:a03:3ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 14:40:39 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 14:40:38 +0000
Date: Tue, 22 Oct 2024 10:40:35 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/6] error: add missing EDT_PRINT entry
Message-ID: <Zxe5Y7KUYloPHCG4@oracle.com>
References: <20241018195808.270688-1-nick.alcock@oracle.com>
 <20241018195808.270688-2-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018195808.270688-2-nick.alcock@oracle.com>
X-ClientProxiedBy: MN0P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::16) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SJ0PR10MB5857:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bf6e19e-e53a-42ce-f06b-08dcf2a77f1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cJxdcbqpFXnnM3em9Bqai1xnsP1P4tV58UgFETpv4qPn0Or11uL5eGsrm9bS?=
 =?us-ascii?Q?KJawm5QTkcCYkvJ1GBZhd1ffVRtCGm9+4jCXhM4O2QkVx/tjFdS+WWcmEzfU?=
 =?us-ascii?Q?DZKHeVB251Mmzpu5JZ55ARMc22mykKtdrEXEQzk/OlstcwoOXGn+/ZDv9155?=
 =?us-ascii?Q?+hx2usgDj2N6xycnew0L6jA5W62XRHLABk9cAdvatRFwSXym4CKCzlddp3o0?=
 =?us-ascii?Q?W6k5mZZWUTPGTNJpQnDoxXS14/2XTDfEd2gc3u4zQ2/BOm4IrZFaCHE46hFU?=
 =?us-ascii?Q?oKjwc2ud1GdFFshF+TYSNQjMWhd5v4Raa3pwkKpgHbs+lL8tl0xqdEylSiRZ?=
 =?us-ascii?Q?WEaw/Zmka4xj+EeAL6XTZGBWFAVp7228mkrnwuQgrpVLB/Y7YYeT1KEWDtX/?=
 =?us-ascii?Q?dEOFDVpszFxGftTqh5/8EJjcItzV6XH7YrqvPdiyt1feNRB39orPI4J0ovdN?=
 =?us-ascii?Q?xhQtG1v4TSfg+BjYwvsy3SiVUIqsEkITrI1NZCKCBqbK6mscCxHjYYYfC+Bo?=
 =?us-ascii?Q?vGzoq/bjSBNMLW+JXDWsfEgkgnFhAG0kWIPSjyvrf2gLCcj3UDRlUllswXN7?=
 =?us-ascii?Q?o1cawrbBitpCjv7AUJ8gjUhGcAySBLvWqpB6rs1IT2DxC8aqLRLi3vpOo76L?=
 =?us-ascii?Q?e3CmIZ4B6BOi8FZhyHVhhbDS5m9MNexsbzFQWhKC3tnEvt5kJz9zE2rnHvPc?=
 =?us-ascii?Q?H1iS7swMYTNEjr38B+zFdZG6Xx/9hIrYEzgoaPcNoIcmYAkAj1aAbw5HrDeg?=
 =?us-ascii?Q?5z74qbIk/GosfZmZ2XJxS668Nj2R0v7IJeTRvHblx94B5BsOhQhIJ5mCgjrI?=
 =?us-ascii?Q?WF/py5HtFMpwuvflm95uNXnBW7jspVYqGa2Mmx92UyFyMX8y9cLPie4kqVEw?=
 =?us-ascii?Q?jHRiSp50AXsOd3abVzecwcIdKFNhW4V5/VvuZoK5lRPPGHCXi4s6tQOIjUV9?=
 =?us-ascii?Q?fdsxubHgOdSoq3EZtzCElsCXwAWghT8Yb++LqSq2twieAdePqweBrghRML+/?=
 =?us-ascii?Q?gbDJtFz3yN+GrjOKcRcnwP+P8Xzqi3CW0OHLz/W1eD+kPB3fTlBqYk0DwWpO?=
 =?us-ascii?Q?nhvfqu02q2X3Xmkm4AhpxvKcyZLixWLX3ZOs+DESYlmD58PqPAL7sbhi5yq8?=
 =?us-ascii?Q?dE8r3tc8PDyH7dK/bhZ1YhhEJLYVaf8dnOsr8H+aj1GGn0yuoLIEzQdrsKc8?=
 =?us-ascii?Q?udRLISjQuIIUrmA2ourQ9WibDg9BE/9W+rT18QrBRPIW/yFSLemKnNW0MGPb?=
 =?us-ascii?Q?SikNzKirdPa1RC+pczLQ/xwrPPqQI8OgrCy+8m5luDCjvGxzx5H0pt/l/wlK?=
 =?us-ascii?Q?VWKB5nJj+/E6bSQP7HClvoGu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sGfLGeaOFScfKmJbZf7A8EM2tD6aOagRH52vwoaV008X1T8xNiWTcfjQNKop?=
 =?us-ascii?Q?JUgBDGrXjA4fN5zI3epYgE9EGfWcBR8nEbQhpVIILSyCFRxAne0UKbg9EM03?=
 =?us-ascii?Q?hxVlIJLQF7ycVPPmZYfWx3p74hnUj7dwK1g0W8h6qv+qjphJUG0wKsX1xuah?=
 =?us-ascii?Q?r4k1qB3MsAU9r8NYsS4wSeT5Cr/ZpVCN+UB8DLDDtXTLVzuCDMrkBnz8CxFI?=
 =?us-ascii?Q?XNK8SZDMI0mgHIRDGek4iH04ScL2HAh/MNHgWKMnN55cfokjPUM35C//wUm0?=
 =?us-ascii?Q?Z3Gf9CL7uo95Gk16V13kIpxQYLveS2L0ide6GD1iM50d3cLD9X9ikMvNASq4?=
 =?us-ascii?Q?sFqaDIh507WL369tfDpvkdNqQDaoMa1899d8jZ1wxo5IbqPgxxbt9LzA092Y?=
 =?us-ascii?Q?5hN95fuVmvAdXuHmvCUedkUgEAkofBN9fflBP96JZYcxle09TXv5fr4XAIOu?=
 =?us-ascii?Q?eSU4gniLMIJeXXp2+QjRhE1gUOhB/BvIbFqHR6MRLk21t/f5wiwBVQw9iChd?=
 =?us-ascii?Q?GfC4ubNPrsdQCP1p3PWpLR+PKXh7oeRP3iRcv+2tLrbBn88eLYglZbUk0Alo?=
 =?us-ascii?Q?ocLvnj/udXsWlI7764tBJ9Xjjsy57InEJ7MS8S+KLAJhSg+EodhFshkubkIS?=
 =?us-ascii?Q?AzfnOc0ZaTCnMQhqEHJPbwWbY8Fyi01KYf+9X49sRGEj68OOs0tydXbzpvLP?=
 =?us-ascii?Q?ipr/6/4qthVEf7qXifljB8k8Umcn/Ll++zD4UpiNzIENh0/DY6jk31nEIlUx?=
 =?us-ascii?Q?/WRE2IR2P6Us2eZZaH/p9PSfb/mPvKGzwz3W+x/eRJX0eOKuTUNgs4O21u4k?=
 =?us-ascii?Q?99sLVXKw4WW7ZlfDp2SSEDjyDAhpoI8uOFyjTEifb+a49tmRLDM7XbNLp2DY?=
 =?us-ascii?Q?bvzpzxV5Pyvu6lI2hm+qTMVokIhKooqzsJGo5BS0T97iB5wcLv07MSh5ZU2F?=
 =?us-ascii?Q?lGp6CVvJ42E1ohnwa9F+XDJYrEbhMSssbMjSOAaWDpPctW+6upIB9KFs1AYE?=
 =?us-ascii?Q?xBslgMyCXF5sSYkhUDVyUY9sPXfvZKgVtiqoimanBTm6CGmqJ675xVDd3JU9?=
 =?us-ascii?Q?iFXEGRBbg9shFZpsYCOwM2PVcsOjFH3TvTJgQeqo53tY1WhPKXs74s2WZU74?=
 =?us-ascii?Q?wxDTZzcuSRRrvWHdPN0dZ4YRFpHGESzCjU93RYZGXSrFHLz97Iv3SF0eS+TI?=
 =?us-ascii?Q?kQs+qrRm9JUYPH80X1kRPTh/+5sW/ZoYg0rT0nFs27yjXM0WNMLJhBo679rh?=
 =?us-ascii?Q?GmlcCSfWB5+f+vV7ec3fv+04zlm+XogIY9f+Z8kZt8VWObpHjEfuse8xAbyR?=
 =?us-ascii?Q?kH1FdI9IIhZdhiPm3kx4Y2L6/xByoFUsOBMbrSIddzSzPHKH1bjbXJtutVoV?=
 =?us-ascii?Q?2977esADjrFUStNWGwHhbgbhfCUgraKhGlXoLTaksfDArTmMPi3XgswEQrCG?=
 =?us-ascii?Q?F5Qf4YTr5w3X0TotSlf0tdydrL85AbEE1Jgx8VW5J/tWeCunFpOkv0MvUhJy?=
 =?us-ascii?Q?12wZGElcTPuds0EDQFrjfcYyCGmYVhUFvXGYRoYsiEpfK4M1dP9FO3/7qjtR?=
 =?us-ascii?Q?OdHUjgwqJPbfQedu0Q9mgvY/yXR4LVIdltNSPtAWLMVIiLx5tlyE2yFZu2EQ?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	n8KuPFkHuEaDNkIffQnOXdWXGklaQPXb16rMMeJnfZC/PMxKsLnigIr0LOixBfOxDWXLMqQtg/4tl+A7WV2CgPWv3pdEUDIPPHj7NGW+88FvUj3w+uZOraPMaoLtgPnHKy7bY/aHkjgOrDZC/eqOvbN9Ii2eVa9VkkNIKGRzJqjg++qlf6l9c4Qsi6WkI4B7Og/Esv3aiCzwE6yX+VDBrL7+u7cHvorQeQIIKgKYN4kGB9E/XB8IWqA9t/Gk7yY4mEkbSE45xzVU5YJ6HlaF9nfSBEQ6LAAKao8SJDgB8YuzzoafB9lmCvceISfITuO6aAagxq8K4Kk6p2d1rWIYckEoGOLJj1hfLgz262MiMWAVLVbRQAsjLLrZMRsnslHsjtJa5utQzeT0HowixQ/Q8/pKVE0wGtU358MA0XrLjnKgxnzHGuYzgl2oaKcI38J9K/PEa3SKUURwvM1eHEBIYV16gBe+OsTRMsFymf589avS9sSX0QDE7u7nSldt9jxIqZZd12VDCrxQ0Ofy4jRBQS8Qo3yMlYl62X+fr9JJKz3RXTmgX6h8YGiDrDBKVCncYUByUEBt7I44uEkfQAVtQw55QaQjebaJFQMxEe63Rdk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf6e19e-e53a-42ce-f06b-08dcf2a77f1f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 14:40:38.7222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPOmVyzqYEKpyvH5kHDrtbUgyHIi0foByPs7hMp4PFbS02VGFN48wqubSrY+Lig8NLtQ4lcaAGeaaU2mAQ3Yw2S9dBXbBoK6GLFLvzYZp08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5857
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-22_15,2024-10-22_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410220093
X-Proofpoint-ORIG-GUID: Y3cGZxOEdvUp-F-QcxW8Kmkwvm2cez1D
X-Proofpoint-GUID: Y3cGZxOEdvUp-F-QcxW8Kmkwvm2cez1D

On Fri, Oct 18, 2024 at 08:58:03PM +0100, Nick Alcock wrote:
> The lack of this made it impossible to print out the last error
> in the list (which is EDT_PRINT itself).
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_error.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_error.c b/libdtrace/dt_error.c
> index 82e114a5b292..213f0d9e1385 100644
> --- a/libdtrace/dt_error.c
> +++ b/libdtrace/dt_error.c
> @@ -97,7 +97,8 @@ static const struct {
>  	{ EDT_OBJIO, "Cannot read object file or modules.dep" },
>  	{ EDT_READMAXSTACK, "Cannot read kernel param perf_event_max_stack" },
>  	{ EDT_TRACEMEM, "Missing or corrupt tracemem() record" },
> -	{ EDT_PCAP, "Missing or corrupt pcap() record" }
> +	{ EDT_PCAP, "Missing or corrupt pcap() record" },
> +	{ EDT_PRINT, "Missing or corrupt print() record" }
>  };
>  
>  static const int _dt_nerr = sizeof(_dt_errlist) / sizeof(_dt_errlist[0]);
> -- 
> 2.46.0.278.g36e3a12567
> 
