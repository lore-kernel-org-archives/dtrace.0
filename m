Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E5F246778
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 21:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768600324; cv=fail; b=gaoiJooVPB7gHM73f3ifs6u84z9bLJKqhU4JjgGxpj1qdvcL3OmXYIcKqp0Xyy/SdRsXaQebUmVSat6JayiYgFsbbUhs7QhDpuJqhz5HuHDxKfmN/psp7aergJWmw1mVrI7gE3SX5buvgBCDkf1qJkK41vGgQKXOyNswrfZUO9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768600324; c=relaxed/simple;
	bh=Ej8YAJuKyovitPEnkXuVzqnXCN8ACs3YTN8Rp/ePwao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=atG11mISetkvzdTk8fJ89LgqYTU2OwFx6J5xPuNxaHOLx8GWnYxJr80Nv0GJNb7Z2oiTbk3U3I7oq1NV0kdH8WIx3/uzSUeA5tVmIOBAAGpO8QTuwXYQiqvxwehS/8xy4xEOGoaTloTeNfkGhulyzdJBmjq/eLnKPyp18AR8QRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iAkexev2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=l+KsR5Q6; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iAkexev2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="l+KsR5Q6"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKZLAr3905634
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 21:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ckzy6ZUtzGEUaB0iwB
	m4VzlK2cvFep3Yp0PsXujpKVw=; b=iAkexev2Xpe96UXdgmdRqvH/x5Xjhs+n9Y
	+rfNcM/IA0docp/OGX2cPdKtZHAqo53GtgbUlyOa5rDGP0TtIHTIKJNsyN0xwOI2
	nrmZ7cGJSXPmX4qwNq0Xza8dF2ZQBjkpxGvU5OmzZ+UMeseYLfFSDH+TnC+e39S8
	MqgsDK1jZjnTozcaqlmjg1GTSGSPKmU+NJlSDfYoI07a+nQ4AHTN60/R0u0jwCyc
	WF2+shlgW2UfBUsHTk2qYYZoZK4L3BJk7mjCRb6ZyCvTzgTJNzTq8qjhkCGGdEj1
	rQmD1Ons2lR+vd/alyKLsyvuYyZt3mJAqXqyT0u2ByGAqVxr0J+A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bqvg80332-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 21:52:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GKKiYU010791
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 21:52:01 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013030.outbound.protection.outlook.com [40.93.201.30])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bqv9m2qgg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 21:52:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jo6h2illdBlOwM+gYMFFf++82cCr7T2q3+hPTiHjnrX9ED5WrISs6QuLndO/jBB4411229z4VbUUbnHzLHIp0OIisUzvnCemDBBG7kI7eHU7xVZqlslMZwusBELcP81wobBIi/ePkhq1odhkNMVhPL5Crz3M5V6711r07FWqrkUvt10TofaZK7Ay/gIfoi4EVcbUk/sJLjnvCowA3zXAo8pPTiPoB5aoo2uYpLasNauDEZITiJfx1p9/vqwVcNYneGB07l9Z/C3AfWy/7wNnWtFF3MsJlCpAoTrtbKtT7tG82OpmWMRFZNStzqb0H3Y0+Ln0PsOTRoslyDsOih1t8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckzy6ZUtzGEUaB0iwBm4VzlK2cvFep3Yp0PsXujpKVw=;
 b=XCYvSFDORLA84ZWwaqSGuj4hUBHK2MbFGUVjgxqsofHjgFPzg27m3d1HHGMYbS5iSDocAisqSKAiJY7JwlNHZdBQP40K72BSU3DWDW3JRhfp7KPGwdKYuJ8+Mb336ZbndwvLMDuxq3v2okwlImsDg174j19gY4zXVfjELUvz/jASyz9HwpSN3bn+olwC0pWsP9pO53xbODStSiTQeSKZ88dYnT3sVRQmAZMiuTnyF9hFyWmcXYCS13pDtaS4RI2XTkXCwfPe8gqZ4/Df90XHh7ykRHSYqGmKWN8jgG6U1fFgHnGEGr0H5QqPnaE05ogWUi40NiHAj7guRm5t+4JsBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckzy6ZUtzGEUaB0iwBm4VzlK2cvFep3Yp0PsXujpKVw=;
 b=l+KsR5Q64s9zIvfYU8x1hQ2U5v4ek36603KqcU6yw0gPpq3zUIPlWn2kFAHW4FN36k4HICoZ/9N4lwO0XToApaIg3XE5VTUiSJVYB83EI9B6IHFdBcULuMAXKYvUjmEWm4TMRA8gi7En/ZB3jukWSamzCLDJuqL/yzdPAy4o++U=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CH2PR10MB4373.namprd10.prod.outlook.com (2603:10b6:610:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Fri, 16 Jan
 2026 21:51:55 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 21:51:55 +0000
Date: Fri, 16 Jan 2026 16:51:52 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] Fix printf formatting with non-monetary grouping chars
Message-ID: <aWqy-H1D-AJYD_rh@kvh-deb-bpf.us.oracle.com>
References: <20260116211432.21975-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116211432.21975-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BY3PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:254::24) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CH2PR10MB4373:EE_
X-MS-Office365-Filtering-Correlation-Id: adb98edf-7024-4de4-a26d-08de554976ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3f8RHZQ62nmLB/ybmzTJHQFL7nFMG9G9vLLjzi09NSW7tHTdyATRC2CYnLpO?=
 =?us-ascii?Q?8n8Qrl7j7n4BgEXNeZX55VN+G/TnqiElVx2G4RfBVyF7wZWWO5YhfzbWZZfC?=
 =?us-ascii?Q?FDt7eXYN5pxL3wQ2AkFJkXO5Z7fPw0SaRNBtBHZwqwiiXJ8ilhOKuZpFoJya?=
 =?us-ascii?Q?LT3rwQ+NumiMWPa8lbrtCq9GKzBbX44rasOfJAx14XJ4rvPuoQDH/Zkm7Ro+?=
 =?us-ascii?Q?DvV1VgrKIQCXEyaw/7yxzcqO39xpevKjq8mizUCfXwUPvGVxDAKBpgo1Z0qL?=
 =?us-ascii?Q?oNi4+C9eeRAz5jFm19pdSmw5k8bBQNqWGuWfHO+y9BPTGu0J0y3X5KpKnEqv?=
 =?us-ascii?Q?mjWRdxbntIgCziLU9Tz/RfXWS67KNNEfycZ7q1ve5pUnfG12qH8Th/rOT9CU?=
 =?us-ascii?Q?98/4z196HrVMnifOqkh+AEciTJvE5yOSQIp51+RWgKijtwoNLhJUOTU0KXMa?=
 =?us-ascii?Q?/1lHjoYpY/CpHv3zrE4t77QiZvUC3zIsRGDCMB8WOn4eVHUcQirONEW/mS32?=
 =?us-ascii?Q?2br7XxFq5/i2sQdo0/bagFX4TwDY9YCKS2bFnI0mbD+mxLNfQLVMwj/wtwX9?=
 =?us-ascii?Q?G86k4qORmbmnNxENkPfSm9JB3rcK26JbsV5x/ieZocblXPQa1r78wDoLhPnU?=
 =?us-ascii?Q?xA08wVgGE9EyL1kWcW9JkxC2HitjioOQ+6o5C2K4scCRxJfFtnJMr1MGRRsd?=
 =?us-ascii?Q?ToQPVdHAovcKhR+pfOuJ4tox+Qvp2B3HSakWgcg8pJTYERp4vPwmPMFu7HOn?=
 =?us-ascii?Q?8xZeuyARw6hr0kmzS0aIkLdTXnHcrEKAerQZ1gtSoOTaPKjGZQ2BLwU92rwg?=
 =?us-ascii?Q?ATebPPJvHXM74kelQABwIZeik9uZ7mkFIjHT6iPasOpQfdJbQVN5pKEkQUaC?=
 =?us-ascii?Q?8ocQtugSZwTUt17Bth9cJufA+2YAD8P52FZGy4IljxY6f2aY3ceh2CrDRZZP?=
 =?us-ascii?Q?uHQi+MIdP7UtDf2xiJMp6tXpCo80VsGxbWj6zxDYabtWXFC/qxfQKhdIo6JT?=
 =?us-ascii?Q?i22KdQtOJrjb+3bBsDHr97vo8HbV28Qso6u+TA4rCFaJbl0A6cBacAqdT44I?=
 =?us-ascii?Q?6JZSvbPepxaxhD+IkRlbFIJR7U2mMpd8Qla/ViCKiOrWPl1x8jeAVoVn3k2A?=
 =?us-ascii?Q?hkIjD5LDf0aQeH7jDbsP4QAx3zFL9BydhKcjwdzupj/nKeVjo2xUYew7Oy9s?=
 =?us-ascii?Q?NbHOxiRcAcNep39aK8FwmlDKwenaenGX9u9SUXlvvaj9rqp0Eqmcfr1jb890?=
 =?us-ascii?Q?Ke33vpMahaS805O1nShmBU4mWVOfOCXbvXsdrsfytoX26Rgdxx0bXovaJ3ne?=
 =?us-ascii?Q?61X4V2cYOTcog3ykYeN3ocjSW+jjR7jtqq8L4tSs8yAtPWjF/VPRaVb6Ga9O?=
 =?us-ascii?Q?V12yK/B+pTFjb8I6BMjHeW3SOL1kN/z3j0NAESUhzLJgoXKcEYOCgUiQ+Z0H?=
 =?us-ascii?Q?28m64G/N4E2kylVL+GaDeChy/Ro+G1DkYXTxxgQqzNi5spbWZvEg65Ha+lkk?=
 =?us-ascii?Q?EkscFPo4hiWW/qPMzgksWlky64OtwAJ1cuGBStQHORo01GaBHp79iWkpFUYE?=
 =?us-ascii?Q?Sb7E0ZKx/zBH9yDcWx4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wx8sR67SFSqFI55Q5L6sWrbSd14lBIDvRURpiG4+AIPu48//+NEWKfp0yVvv?=
 =?us-ascii?Q?kzCgwK4kxmsaI/QHsVhBDAgsVVlggYYq06qmh6sVYAsAMOWace/pkdFr5ouT?=
 =?us-ascii?Q?YpX5WU6CC0iTn7OjPP+WgIqScAxVB7RweiOtXzR1q1GgUlQgpfGs7hshTh75?=
 =?us-ascii?Q?PCnZWhOZEubl3heTAYB9RLmr+mK3lD2ZsbqkalrCuf7Z3H2pBevx6is4FiRM?=
 =?us-ascii?Q?sa92Rlo7E1o0GIbIhdOzqok3d+nf7EbIA0xksvDG+5C850r3qRl4k4zAvGid?=
 =?us-ascii?Q?Jq5y022DAbpRILcrGyYt75XKqMY3GswBSXHufl4SmC+S/y7kptCFCgQbmhe3?=
 =?us-ascii?Q?YWb+6sBC6O/WlipK1Q01HooTsUFRpXYCWPJFyj7zFAa6iV3g9NKOOdaSKGsT?=
 =?us-ascii?Q?MmIFWB6ZCXubKycFhxXsENPwKoRApEwB14TrpbVXiNH2OB1yJRRBPzfEq03T?=
 =?us-ascii?Q?pP1xb/WbE/6+rKaegDCEUxIvPJ2xGhp4/VahbIJ9OrbNFrymTlQCz1RwYUbY?=
 =?us-ascii?Q?Pqe1ZME41vr9Tng85mWSEkhO4yaLIgCmY+IdwehqmdkKWwUR3EcCQRRzX/0i?=
 =?us-ascii?Q?0DoaM8ggVQFWWxpXUgtL6i2Af5zhSOoGIOLhhwod6EZLceTa+XM1lfrp7U5k?=
 =?us-ascii?Q?0LSs2LFoibra26btbNSbxkvf7z0NLB6suikiQMx7hEt7UsNJZjFkzY66u86a?=
 =?us-ascii?Q?LqXpSq2NRYWUpkqTc3V+U+x8SWxuODEl3mVzMzIkrb61Dq3G0X30el0cmKel?=
 =?us-ascii?Q?0b/OJpmINcRvfBU4/u41m0/v2Qx94nAG/P4ddBGkuXmaU1tjNVGv8VgsymH+?=
 =?us-ascii?Q?DAYXQcbCCCjIIgF/Tv25jPtMe82ali8OapwRqIdDnrqHsKL95SAC6xsZ81OU?=
 =?us-ascii?Q?jagkBwu+XOKZA1hnGS1EOW0vXhfAgHYNdc5vUuw2uftED4s1qO2/Ip7vJdM6?=
 =?us-ascii?Q?VQ3OG8pOpQJ5NxODENCcQbTn9rad4PypDoLQC/FAkelUNNfAXeYg8GwGVpcJ?=
 =?us-ascii?Q?vucSXV8tbjauXB3u1StPZEGPSl91drBTCW9GckR5mFRmMy9UdKN7V2aTdhEE?=
 =?us-ascii?Q?7Bgyas/wXlR4ha83tTm6+V1tBBG3lJKrnRF88qSh9Akq/0+ByQslb91N/jL3?=
 =?us-ascii?Q?AtQqnb57KEZECWh1IJCTPY0+a0jOl/J907Uj36dfLFdalpMJ+f4TqswhF5YR?=
 =?us-ascii?Q?vlpjoEL13BohCOyruH2bg39Mp9oE1E4tm/YQUpKY+OxrCTq7z7Dd31DNeAHz?=
 =?us-ascii?Q?+P4dv+YaJR3sN6qvnFXpsusiTg4BDkLMmcrb77OLX0j6NcjO3eQv51Zu4WRh?=
 =?us-ascii?Q?aO6T5iRPmSJH3Qp90qZDz0ZbzzBJlQb8Fzns7/O0mKVT/vnk/8j7jTDpaOrk?=
 =?us-ascii?Q?a2q7BhOh/U+nc7dbOhyWpxFmmxNyCE3h3UApQQc2JCFR+qM0leWP7OSrwG1P?=
 =?us-ascii?Q?McEpLEmQt2ooYivQnW9VK7P7EAXnJN44YghZCsgNjAwyAb5ML++rQEeEpip1?=
 =?us-ascii?Q?qR9rDA58xOeixP9jIJq+bHtPyh+HuLQsIKUlrVybtrUndG7o5fBf6qmNuiN8?=
 =?us-ascii?Q?iR8qw2ieIAXZxnmWx5DodRMdAFEmI2yZaKUtdrzOlSxFrg9YoUCjz2scrsJe?=
 =?us-ascii?Q?bt9VAupTGD1j9sbUzYh5mnoY9YAjpHfwURDJ206tzFdcjoF8iCIIoxUjGLo2?=
 =?us-ascii?Q?aRsv+dj0asw9H6CekMhnfT8Clp2f+6Y/ZfV1XYrc5jbn0wyYDXP8j7Ym3Ve8?=
 =?us-ascii?Q?eTwB820IOSF9y2KxXfKxW+4coWznVxY=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YHun2QJ6wsd2u2++EMbJEFQCPE+XbIjn0viJsDeCl0Lr2dsX6EG2aeaydL0c+zCVNH2QHzuEEuIQ7XXjdJ610UzDUcQhaZtRVrSL4aHsPFow9xNOAcxQ/mdhr1aznb7SbAY3LtZT48hoe1IWpmtPHEdWOcoxYjttJ+qwnVBf1Yx8jsAvM1bNUcFJjyf/HDPT7PIfy3v3ylofVzwj7ONqARQLMmKls0nXd949NT3K4F9JmA90V8cpWw7+KQW8g3tXdfJZIhh+JFqbeA9685u6gRgx4VZWoG5q6tmccNDZ0WBgkzspQx740A521FSCGfiZesNrvqwEgg/PwQOQnvH6nX5N6/Ww6IVLwIDYvYF2ujU5DJP/l/3duLUFMvreww1LS/mU3ueF6TWu1us3vtSSgYgkfJANY96Vm214CaERcrSoPPhbRjju+ykyLBuKx/srk1TWPPO/os0BRCZc1gyJSjixj3KkE7rHH0nBK5G/Jq3V9g42R2f2cNqELowxHNKPL9ylcHdMw2Wpldzj8SfFFEM51EHwKQs+qNk0Os3xjLjkY5GJm1/OVE6xPjf1IXc1XTZPeC837LCnOGHC8Hq0Ewkt0BzJx38iwE/CYsh906U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adb98edf-7024-4de4-a26d-08de554976ff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 21:51:55.2033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7PVzRKjoIUNlRYFmjyrMmx1owQ89X61hqdKpIr4VvqWfsx88xDQEP5zwZSYSuWiGdvGWS6HT1d7iMbSS9vDRT8Z8TPOHxhp4PHPuD/+EPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4373
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601160164
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE2NSBTYWx0ZWRfX7lmtOU6h5qdP
 d1/bP9LrZwT0cajPYI6BsnEWdU9rnGiZmIwIk4A2cukgsMFvN+FPwNh20zh4P43a0aOxiXdYCC8
 t5yFoLILLXNIx6G6N7+opzr3bV/wWwkWBLkhIUMTuGpZ/tZtmZw4kULSxcBp3FJvKe1O2/qI8Wx
 WR60dc5xY4ZXjZPBb1KwhBYIcle0746KPXCMmc/BZ/MFu2m/37HD0O8MXjNBQDpxnFBV2JNv2QX
 /0T0EBxr6frfnTrYOHsgfRx1xcSWlzTBKlR9LTMQL5hPacxtouqOhj7maljluy9DWY2f5cNv6sX
 e1z88e6AmqyJf/bY3cEGknv+4kL/HIF8xYOgpgWrsR1XFRI2EfROvlHBEEembZSHopoxrnt+3JB
 Yvg7Ueo0e5d5OavHkpb58G9iY5JGrB5ajZk6bXQXU56/2qSMT4kQdXsy38VdyALe+g1mlYAVpmf
 NgGcCcatSEeEiFm35CQ==
X-Proofpoint-GUID: oB-taNkpmeDfI1G6Lb76Pc6aLQoefnKn
X-Proofpoint-ORIG-GUID: oB-taNkpmeDfI1G6Lb76Pc6aLQoefnKn
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=696ab302 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=TZ-BptfkB5O5dS1Um-gA:9 a=CjuIK1q_8ugA:10

On Fri, Jan 16, 2026 at 04:14:32PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Non-monetary grouping characters are used to separate groups of digits
> in numbers that are not monetary values.  DTrace used to document
> support for printf formatting, using a single quote, for such grouping.
> Currently, support is largely implemented, but simply not working.
> 
> Add a setlocale() call to pick LC_NUMERIC up from environment variables.
> 
> Orabug: 30430270
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  cmd/dtrace.c                                  |  5 +++-
>  test/unittest/printf/tst.grouping-LC_ALL.r    |  5 ++++
>  test/unittest/printf/tst.grouping-LC_ALL.sh   | 29 +++++++++++++++++++
>  test/unittest/printf/tst.grouping-LC_ALL.x    | 13 +++++++++
>  .../unittest/printf/tst.grouping-LC_NUMERIC.r |  5 ++++
>  .../printf/tst.grouping-LC_NUMERIC.sh         | 29 +++++++++++++++++++
>  .../unittest/printf/tst.grouping-LC_NUMERIC.x | 13 +++++++++
>  7 files changed, 98 insertions(+), 1 deletion(-)
>  create mode 100644 test/unittest/printf/tst.grouping-LC_ALL.r
>  create mode 100755 test/unittest/printf/tst.grouping-LC_ALL.sh
>  create mode 100755 test/unittest/printf/tst.grouping-LC_ALL.x
>  create mode 100644 test/unittest/printf/tst.grouping-LC_NUMERIC.r
>  create mode 100755 test/unittest/printf/tst.grouping-LC_NUMERIC.sh
>  create mode 100755 test/unittest/printf/tst.grouping-LC_NUMERIC.x
> 
> diff --git a/cmd/dtrace.c b/cmd/dtrace.c
> index baa73e9d7..6cd7aeadb 100644
> --- a/cmd/dtrace.c
> +++ b/cmd/dtrace.c
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -9,6 +9,7 @@
>  #include <sys/stat.h>
>  #include <sys/wait.h>
>  #include <sys/compiler.h>
> +#include <locale.h>
>  
>  #include <dtrace.h>
>  #include <stdlib.h>
> @@ -924,6 +925,8 @@ main(int argc, char *argv[])
>  	pid_t pid;
>  	struct dtrace_proc *proc;
>  
> +	setlocale(LC_NUMERIC, "");
> +
>  	g_ofp = stdout;
>  
>  	g_pname = basename(argv[0]);
> diff --git a/test/unittest/printf/tst.grouping-LC_ALL.r b/test/unittest/printf/tst.grouping-LC_ALL.r
> new file mode 100644
> index 000000000..077a0b7f9
> --- /dev/null
> +++ b/test/unittest/printf/tst.grouping-LC_ALL.r
> @@ -0,0 +1,5 @@
> +123456789
> +
> +123,456,789
> +
> +success
> diff --git a/test/unittest/printf/tst.grouping-LC_ALL.sh b/test/unittest/printf/tst.grouping-LC_ALL.sh
> new file mode 100755
> index 000000000..970dc3420
> --- /dev/null
> +++ b/test/unittest/printf/tst.grouping-LC_ALL.sh
> @@ -0,0 +1,29 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +dtrace=$1
> +
> +for mylocale in C en_US.utf8; do
> +	export LC_ALL=$mylocale
> +
> +	$dtrace $dt_flags -qs /dev/stdin << EOF
> +	BEGIN
> +	{
> +		printf("%'d\n", 123456789);
> +		exit(0);
> +	}
> +EOF
> +	if [ $? -ne 0 ]; then
> +		echo ERROR: dtrace
> +		locale
> +		exit 1
> +	fi
> +done
> +
> +echo success
> +exit 0
> diff --git a/test/unittest/printf/tst.grouping-LC_ALL.x b/test/unittest/printf/tst.grouping-LC_ALL.x
> new file mode 100755
> index 000000000..c55a29a9a
> --- /dev/null
> +++ b/test/unittest/printf/tst.grouping-LC_ALL.x
> @@ -0,0 +1,13 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +if locale -a | grep -q en_US.utf8 ; then
> +	exit 0
> +fi
> +
> +echo the en_US.utf8 locale was not found
> +exit 2
> diff --git a/test/unittest/printf/tst.grouping-LC_NUMERIC.r b/test/unittest/printf/tst.grouping-LC_NUMERIC.r
> new file mode 100644
> index 000000000..077a0b7f9
> --- /dev/null
> +++ b/test/unittest/printf/tst.grouping-LC_NUMERIC.r
> @@ -0,0 +1,5 @@
> +123456789
> +
> +123,456,789
> +
> +success
> diff --git a/test/unittest/printf/tst.grouping-LC_NUMERIC.sh b/test/unittest/printf/tst.grouping-LC_NUMERIC.sh
> new file mode 100755
> index 000000000..1e95901fc
> --- /dev/null
> +++ b/test/unittest/printf/tst.grouping-LC_NUMERIC.sh
> @@ -0,0 +1,29 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +dtrace=$1
> +
> +for mylocale in C en_US.utf8; do
> +	export LC_NUMERIC=$mylocale
> +
> +	$dtrace $dt_flags -qs /dev/stdin << EOF
> +	BEGIN
> +	{
> +		printf("%'d\n", 123456789);
> +		exit(0);
> +	}
> +EOF
> +	if [ $? -ne 0 ]; then
> +		echo ERROR: dtrace
> +		locale
> +		exit 1
> +	fi
> +done
> +
> +echo success
> +exit 0
> diff --git a/test/unittest/printf/tst.grouping-LC_NUMERIC.x b/test/unittest/printf/tst.grouping-LC_NUMERIC.x
> new file mode 100755
> index 000000000..c55a29a9a
> --- /dev/null
> +++ b/test/unittest/printf/tst.grouping-LC_NUMERIC.x
> @@ -0,0 +1,13 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +if locale -a | grep -q en_US.utf8 ; then
> +	exit 0
> +fi
> +
> +echo the en_US.utf8 locale was not found
> +exit 2
> -- 
> 2.47.3
> 
