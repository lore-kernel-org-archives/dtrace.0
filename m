Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4718B1AF0D8
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 11:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769919; cv=fail; b=RW26kZENUugKzkpHmTeO3SrVH56C5o3eUH4D1ichHJFsRGueLBC2bDbVSIAb+Hl68SVJVISiggb5BY2oU7KqY0qeW7PPoVavmK5gjIce07gAlcaqu9wWPvN1UCpdi/5Zu8JY+/af4bRWszEBba33bZZGB4esLkaFLvt9L6/ISKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769919; c=relaxed/simple;
	bh=cc+J7SiPikpWiQcRK7W6RX2jlfbBJghF6gTs8P8KvW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=odIy7YjJ2PHbh75VqjUkax70p/XjZroHW7A3wDEutUpyB9iTVEn85zD3N+bwqeYfFiAnxTlplwcxelqjCO3faJ0D7lUWk8616+K+vliCxsJP2bH6zRvk1L7ZWS569sD4GzsAIZzm5pcNNzjgPA/szWLb6Q6qhXM+VITe9l+0b4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Yh9Qctaj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dgK9LrAo; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Yh9Qctaj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dgK9LrAo"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O2fp4h008681;
	Thu, 24 Oct 2024 11:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=68cPHAF8RHSzg8CMsSiRKLC93AObzsOVfXY7Tqk4k68=; b=
	Yh9Qctaj+kjk+Xws5ctg06CsDXj+RWijT3wOg1KDVYIKq0hZsStNd1Pif3RZDmFc
	LMhieZIQQE/7zoOTPsNQpmlqZ03fYl8YkGLvdGgYpsZT1qg1FsvF7PkzwfDMfzQc
	vP6Vk9Ih6mtL/l3P3OSJg7Qd2Z9rh0KDgeh3ufufIIoQufdWObP4HZ7Acw4Oa6y+
	GdOx8nzJV8ISA5S3n/2nX8Y+l0K5zVDf4SOrcD1vVMi4FyyKnHhNb3j3SlBP2Xa6
	6CwhHbFikkdiAOe33DqX6842l3kLpgxjLyZ+Ku9ZlgXC76hsbZYdQFneTc9QsLH+
	9PvZZlRrnKKuoqZSicVIHw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55v2bpr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OB8t8I030951;
	Thu, 24 Oct 2024 11:38:35 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh2tbb2-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKtr7y83FlZzmXpIYkKWdx7DPbyd+06v+ECiZINgCCcubUOdZZFJOkUvmVBqLwEaqO5xgcwO9Tk7WSGbNcYlbKlFis1DC98gZnOACpCtQ3fSVm1dLhgjsH8+yniwa4A/I7InN5LaCTogElRq8fxoNQypRVdKUuLXtoDl3yHg8o7waEfvzGqCS2laLAknr9XppyLWqGNMWlDmam7Z5D07g/Ra54KqoMPSKvtI3/zoLW2rUaHDKdLDcZuZe8BRwarqmqhzf1z2VkvZKdCNdhIm85a/3gUSkPT1FR+AiwpGDaZc2Fko8fkAWaWNGV7SjQCdTgrIWsBqfGbGbyM1ZASAVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68cPHAF8RHSzg8CMsSiRKLC93AObzsOVfXY7Tqk4k68=;
 b=k116RiHYpfqia7AYw90KzzNayhEhYKDJu4X7dmYSIjEemaPSzwSGFOeJw8lXunFzqxoQGs73TdeqPsRgK58OXdN7ZJ1rhHPALjHKXHQ3rdTZeeWSV4NDDZydq96euSlvBqwWBw1+GvVVrNO2RZSTqyYnXF/MJQ2/GJXm+w9L07Zn+8pWfm6w8Xt5UuCgzBK1z2H2tRav3PKeF5On/3PlRBhcJqsw85NXPPVjtAKlEFHH0B/NqFPaBlE9RV03w1IdpH2b9U7eWusba61JrzFrflHXlf0eq0Jtc3TRUoC6XWgcEtpD6lsRIYXPJN3zZu8j+4NNmDowtxXas2Vf6ZSfqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68cPHAF8RHSzg8CMsSiRKLC93AObzsOVfXY7Tqk4k68=;
 b=dgK9LrAohq8xVqa6n/rYExUTSEmC42LaH3ABy0AqfwwFLqT8Hpq8gscCHyfmSmWrztIu5TcsWAr7bQ43NDJVDKQjdfOR61pn0WBbV7JvACsIGubTBhUxtPF0Iz6LXaUbp5M7txDF1oQrVhM9hEOOCqhmLGjyH2Oee99e4NijIx8=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7986.namprd10.prod.outlook.com (2603:10b6:610:1cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 11:38:21 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 11:38:21 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org
Subject: [PATCH 10/14] man: fix blank line in environment variables list
Date: Thu, 24 Oct 2024 12:37:54 +0100
Message-ID: <20241024113758.182050-11-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241024113758.182050-1-nick.alcock@oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0040.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::15) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: aa8ac57d-7212-4ae5-fa28-08dcf4205d1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uVBsSf2bqcOhmxJWD1wG6tXKkRLBpimbiLzPIrakjz1dzmOpRcT5ZVce1Ygi?=
 =?us-ascii?Q?uYV+m8jN6+rfP11sGJTaJa/MbG1NoownN6oJr4BL5vfkIEQlYAIzwECq88Xo?=
 =?us-ascii?Q?A04TcfkT46v0XDotl4GRWh1QWTZepc/dmk46WOYpxXJb8LGN+b8EfrnYB47e?=
 =?us-ascii?Q?3zcS0CXFifxYD1+MPOU6+T8B4WW4x2XX6bDjAoZbTaYcEnUmdHhBzh5yst70?=
 =?us-ascii?Q?/2L7YSQnxC4yN2Qh0rgH8JvRU/AUeDgEfIPAQNgaZN6j6zwuWB13D6B4m77c?=
 =?us-ascii?Q?IsXwAox5k7tV+QndQwBzgXv3XB3qRfBgtu9SiA/TGOqnRnR85uYMw1AREbYA?=
 =?us-ascii?Q?rT9Mkb+zxOMXvftKVCzXZAVSWIOxlOwgVb99+YzS/VJ+5+3BTWct1vx+rslv?=
 =?us-ascii?Q?Xw6Ec/cvSsQVeUxyc24wt5upJxxvCJGvu1oGgci+usfh9ruRgoL9zik07G0O?=
 =?us-ascii?Q?eNErJNt3MbltffX7953TgiXnu0UK561y0Sf91iXvyM1Y+5LNfPFOze1gneqH?=
 =?us-ascii?Q?fkocQui+pR0zqJIJrt1hdvrA+6xYF3Fp3xluOCQeQYrXlsSKEFC5gzhlWtgE?=
 =?us-ascii?Q?Sct77xWgvwBMEIhEhmF0DJV5Ft5FA6Pf80SS1tFwkEFVpJ/nDB7kJcjWqFUz?=
 =?us-ascii?Q?k9yprPPsnkGnj7nLAXVxqlZsVNqlV2WMh7WAOirFdGEdYFrQ68MTlACn6+83?=
 =?us-ascii?Q?ss/oU9D4K8HpmEHge5GlgcyL++9OlhoksSdPcalxC6N1qv5m2EurEZd1CuSA?=
 =?us-ascii?Q?8Cp+FTllG830kQ9Xx80SR/PabWqoCg5q6xIx3WDsFzMt5lIHf8EMEINVVyU4?=
 =?us-ascii?Q?epoeINofa0R2A6v9qs6xXKgq1BtSPYzWqhb7/NolkPhZBjelyuwbRPID+Oa6?=
 =?us-ascii?Q?HK2PwiBxLBUKr88p7m9j5W2IzV7S7RwHh70tJi0ePW981RThSF7XizVUHGv+?=
 =?us-ascii?Q?6uJurCVIoKY0g0HG6mTCpbc88v8iObwk+sYc8X3dD3YI/VnBdhpZ8uIVLVjQ?=
 =?us-ascii?Q?f7yQ9eFu1ymdQ9WL93tMABXygUR41q591KGlZcUZL++gCDEZTk2wgHMVlF+C?=
 =?us-ascii?Q?PoABPt06OhUt82VD9n2o9mXpLHxqlRuc4/BO5iAQtkudpgc/orEUaShvzGSz?=
 =?us-ascii?Q?5wp7uyVKwafxrNYlKB8eSitDPZKStMoG7hj+zHth+ZAEbozlqj7I0V7VLphU?=
 =?us-ascii?Q?p42r7Fa8rjszQXLnh1HSDsq1oDQ5qZlf00UhJGG7aqVesKal7RzuLKW/WbPJ?=
 =?us-ascii?Q?vaO5ePiJldl484TEmQLz5G7ohrJft27tKNPezHzhBECps1BBuXyDh8xRgrao?=
 =?us-ascii?Q?ANhf9Tz2ZS8IaHJZI+b42Azr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I50notvZOrUrUDAS+yIlsd4qa4yBUf+Lk5VCJYN7h9m0bhO0m07Hg4kMzjL3?=
 =?us-ascii?Q?X92hPEJDHhdKVTOFIAbwr5DNa+3gwzBBUiQdD9vdEbHliQmL9WJ/pviVc+ZO?=
 =?us-ascii?Q?CtJVOx2r1gyGIK0YSOdLXOh0w77a0r8qmWt4mtMjr9MqWimzSnvVRhqnedu0?=
 =?us-ascii?Q?mSdvJx/MXvRugrmDjEPCroVKJpmKPaBQ7wU3W1Yk3w9rAeSJYEX8Dx3J0LY8?=
 =?us-ascii?Q?S6CxfGNX4o6iekbsXXDEuG9iyY47L83sWOI9Gjeq/NMVI9Czi7yf6XRDoavZ?=
 =?us-ascii?Q?HgqybkcZLo2XRLjzJqYzVkg7zP6r3t10wTalNu+PuOt/zRyV2GGiGMOO5wTQ?=
 =?us-ascii?Q?RtxHU8epcam3PPcJhSvcXDaG+1aTXMEEtQCmZJLKhIaDw4TarZtldRpuClTt?=
 =?us-ascii?Q?oCwxJYIh8ajXIdxhEnt1gZnrQYHdycMSJlnYFJN2wR3sljjj15jARQ9P1mKB?=
 =?us-ascii?Q?RURaKIW89D3eFPzBwdl0DlmpQsyUwMMz0l0kn0n0U0fG6LWtqTYkeEUTUhLy?=
 =?us-ascii?Q?7XO6KoanMOd5kXIMggcpOolOOzPPSDNa1CVxHWXKPBOo1c+EXTbZ3iOk+QYn?=
 =?us-ascii?Q?L4ShZyWtFiTzaUBw5IBjR18uIuB03mFCaZLLoG2yKmKSlRxYYG4EQzwOjfzZ?=
 =?us-ascii?Q?v8a1VmMitYINdSX1P2hyG8+CFY8UMFOof6d/DeO7dyqI5i6pMsbk6fd1p5Pb?=
 =?us-ascii?Q?pE6uESL4Cvkp/jaEG5D2nI8kx5AyVBNhGcJQ0gi6FnegD6ywQjKnCnGgOAGq?=
 =?us-ascii?Q?wpMOTpy8zXNOveid8lHrJAuXtW2T8tOfsfTFNyi+yDCzcomCrNWLDpsZbY6j?=
 =?us-ascii?Q?fxlTeLowo+vrCILv+HDLKTZQP+5HBjIyxJ/4Big6hsO6tzUhlEU8jnOrCqvL?=
 =?us-ascii?Q?r4m5TovgXuQ8TuWdFkGfL3HOvRuV+MiCK2VyXl0b/z/jM/lPJJMfikc+lwwX?=
 =?us-ascii?Q?2p9Wt616uZV+5WoOcKzINbFzpeQKZWecr3iNbcWAOaqF+a4H7paqDMBMocOO?=
 =?us-ascii?Q?tFxZtwDgeUo0Zyk9jTXpqvAOIYq1OmB6CbfVNDGM3eTBf4wtyws0XOMUCCTf?=
 =?us-ascii?Q?MbjVz7BgXYtfdoAvW90/Px6QtDebkyKi+JPMBhaOTKSHAKcVrwUK7B4vK82X?=
 =?us-ascii?Q?znQy6YuN+o+Phr0YlS+gmpsxuIB+rE5u2Fpoo3chOgN5Bv7Uj6iydBPrceh+?=
 =?us-ascii?Q?i2j94UHU6iO3Qhikp7+WDISGuJYBr07sIY9h50FbRWMmtTbS48hccOutICU1?=
 =?us-ascii?Q?mxsAJ44ot4/XAPVQZrVxoQuPsM6bOqFmOOQz2knmcZlCf8RLuLztSd9vmTWG?=
 =?us-ascii?Q?HSeIFWDNZ64pRam89cdEvGCsrWnTTU+DrtsMQUWrOswCMVJI1tM3jYBpX3cr?=
 =?us-ascii?Q?AJW8X1yj/XmCca0YskYUU6y3CQRQoIgRXuV8/6it4x/WokgYuCwj0Th/yDIq?=
 =?us-ascii?Q?W5WOlWID6SGqtx2WzCEECbVLneYge5FaZlVfnvWV2xtGKzKKoeXK2RTYZdOn?=
 =?us-ascii?Q?GMGmv/aEAI35Fh5XjGlod/pRAIFYzZXZsQQjYNSFbIZK6TT0yuzL74U2Pp5K?=
 =?us-ascii?Q?HNyDK+Wn9vF3R90QXCzqQQ0VKXAViMCjdcMdF4/Ux0xQ7B4VT7GrlOdUj3NE?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BNzIDEGZWud/FVqXaYxXSLjUERJV8LGQW2LL14p+KXTPKEhwM6XUbgkM85xojZU9Dxj9tE2esoU8OqiC5Cidv/Tr3L1bvQ6iR6aKIvdn2w/lYUZpUp4jZwNETNjegL+ZmF5+GbBxDrAYppLUSqsSBsQR3uTVzbFmtQGN4UnA3r3/BQqzSiu4cvWY+/2oQqYOaC+rz7A5KZGMPreINAjv94BzoTqw/hoeyGu6Bb4plODcIVYNHhvzWOOrEx+tiNls8FvBM15NSaZEL79LVjNXNrMKuKQWd7xdKZbQfkYtWsoh3XM0wLWItrE7A2CwCFEf+ubcezBpyp9S6xKzuuQL6cYDHFoIZwW/bRNiDclB7gXNEiAIZX8geI7sfklqX71mFwRbhy9+BySpWj7TvDaWg//OU2wQ2MWeoUHuZJcDkYIZLx65KsaBS4D1juTeXSgRXjVHZwgEthstbPjxxGzcKUjCRw+MjJXczg7EOfbh9Y2cMEs+LArQSSYgEFkDCPOQeOUH3+KCUK6WXV7lWdsLYHp6tggBKbzW8ZEafNEUzGccllS9R2yIEKEJpxIydP5mn6NjYy9n2Dp9kpRUa+Yd9sLap6FWBsX6sgeBE/bvGsI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8ac57d-7212-4ae5-fa28-08dcf4205d1e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 11:38:21.8923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TdwMIrIXRrg5VwFAUFjku6l5Y7ExyW+PcSWC5bppqCTFJoXz184JUJCku6/OfHPBHzQ5cOzhGmd/59yiDjKttw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7986
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_11,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240095
X-Proofpoint-GUID: q5uRV74KEZxDSMnwXUZq00w_oCKE-H-h
X-Proofpoint-ORIG-GUID: q5uRV74KEZxDSMnwXUZq00w_oCKE-H-h

Use .IP instead, to get an indented linebreak.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 cmd/dtrace.8 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index 0639db2136a7..fb9392d29cb2 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -179,7 +179,7 @@ Print libdtrace debugging output on standard error.
 Print CTF type library debugging output on standard error.
 .IP DTRACE_OPT_*
 Set a given DTrace option.
-.
+.IP
 Options set this way are overridden both by options specified via \fB\-x\fR on the command line, and by \fBsetopt\fR statements.
 .
 .SH SEE ALSO
-- 
2.46.0.278.g36e3a12567

