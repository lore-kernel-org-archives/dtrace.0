Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A7D2472AA
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 12:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750337509; cv=fail; b=P6yEyUozxNf9pZdzvLGBFRDpIN7hFbjZfRrO3lt02VBPXM8HFqo9BbVHYKLZwom04aIfcNn9VdURh3ssdEyXgt2k0qYH7RNS0Fj8RZRoqyYEE2ABKj8qSk0FIbCM3B36zm237Ad2fsgEyKXMQOS+ao7I6T9fxmTwo4MFLeUsFXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750337509; c=relaxed/simple;
	bh=m4ZfIVgNgsF5rMVfItLT16+JKvC2VWrLHOdgVLMPj3c=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=TSOqPpq1KjdvunPVNuIUiLWHJEq5JNWnQBSqO/MG7oW5ie7U0aCCDvUytvW7v519GqQKTydGDqJ9o0UQLovcScIhPkNC0RJ1YLB/NRv4eALwd74npB2vBKb5Oq+f0UPDjfox2NpX68s+c52apB5Y80Xm4b6a+JgiLRQ6bhQRpik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bltuxt/y; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mYj+wm0z; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bltuxt/y";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mYj+wm0z"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J0fa9S010813;
	Thu, 19 Jun 2025 12:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=BFGKMiZ7v9bUZwge4C
	xqVbJjYmaX1t1UDt7wbFCSpqQ=; b=bltuxt/yffco+AqXb4Gx33SXz2d2wBQLrg
	EcZKpGrPHGzDK3LDdPUzYZTvk8PRGp53f8iBh5Es/DC2tXvGM78YEMOGoaExsnlu
	oa5g+l/pxcySFE4AUeomqoMwAuazby6R7xN7XlrEM+heIOHYudClX5DGfAvfGO/h
	u/BR/J9K1Lo3vr+L8HhfopdtM3Mfg+n1ENXhS4vEbZZTOq7YZ5GfV1NgwOay9EER
	xky6HEGLZNm37xGT25gkfFHzQZi44UiQDOIHXH0KBIiwFbekiVIPU/IT2UH/DV/o
	86w7pPFsGRNrVHzULvSg55G9Y+b8nwDrv26+vrHmv1yoDhkQaPQw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4swv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 12:51:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JB1IWo021712;
	Thu, 19 Jun 2025 12:51:37 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011024.outbound.protection.outlook.com [52.101.57.24])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhbmp99-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 12:51:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYoLbzaer2AZ8R6uV+dywgk8yRCVcPhENUs/SwYHLgfhdCTawXQwn+To/7n1QOr3lfCgny8HtYck8a2SJG6mRQJVJmUS+i9vpqAzb7v5f9+qj12GwP1ftJG1+t0MQJ5muuQbVlqzsoynMV/D2TnGYwYv6/ESmMMw8C0KitC6GXShV9JO5duooDSlbInOAjaPM5O2pNRoT46sxNAOQm2FVQ8+8etTge5fr/fS1zva5eC5i6qCFX6EhBuJ+j3cD/JsB+hzYlhQsPnPo3UnX0yVw1rLYEOmjLaldKJupr2o6ngXU4MbZltK8Bd4u0aK0WNQucXqI1RPgApW9Ej62BuRUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFGKMiZ7v9bUZwge4CxqVbJjYmaX1t1UDt7wbFCSpqQ=;
 b=L1UeHKzimMjzYDw/EFUTbmuU/1u4QdMklmHdV5VRTYXQvVzKFi+7fFHvZ9lWtsgHNtZNAXfIeIEtiCEiccBUIZm7W0GhUXkbgqWJwwo4y1xooH6vocZG8bh4SVoi3LFdJ1ncsb1tqtD+fMkc83JS5ucS917Mlb10zGVJfVXU/GTkBruuEG+yXIiX7QMWV0docY17561RPK1YmJFwQ9Dx12wWQJlGMFnRCR9PVPpEebK0JYNtK7g+h9mdjWSDHQhzv/qMZbyuxVTVv0/24k0c7fA7UNJmzks/x17wUFAweahgUqktj/jPy/Go533irERnFVHJVVBf0OoTWLQ9XQO5qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFGKMiZ7v9bUZwge4CxqVbJjYmaX1t1UDt7wbFCSpqQ=;
 b=mYj+wm0z93HDgmaIz0KW0vABEqexuvpL51pTeX03GAM1Q9TqmjsM0/RRgdUz9TLW036a9CN3s3VIznOZiCHuP2Va29UD2OXnHiUXFYtXz4gqe46JB7cHIITDcz8+lSN4gk4JfVTb3+b86/t+0eT/eqhSgdZdxHqJsx+tVTzz/c4=
Received: from BN0PR10MB5029.namprd10.prod.outlook.com (2603:10b6:408:115::16)
 by CH0PR10MB5065.namprd10.prod.outlook.com (2603:10b6:610:c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 19 Jun
 2025 12:51:32 +0000
Received: from BN0PR10MB5029.namprd10.prod.outlook.com
 ([fe80::b85a:c2fa:6a79:393f]) by BN0PR10MB5029.namprd10.prod.outlook.com
 ([fe80::b85a:c2fa:6a79:393f%6]) with mapi id 15.20.8857.016; Thu, 19 Jun 2025
 12:51:32 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Sam James <sam@gentoo.org>
Cc: dtrace-devel@oss.oracle.com, <dtrace@lists.linux.dev>
Subject: Re: [DTrace-devel] [PATCH] Revert "dt_pid: pid grabs should be
 shortlived"
References: <20250522181016.27661-1-eugene.loh@oracle.com>
	<87wm9fd8km.fsf@esperi.org.uk> <87cyb7jt9a.fsf@gentoo.org>
	<8734c2hte6.fsf@gentoo.org>
Emacs: ed  ::  20-megaton hydrogen bomb : firecracker
Date: Thu, 19 Jun 2025 13:51:29 +0100
In-Reply-To: <8734c2hte6.fsf@gentoo.org> (Sam James's message of "Sat, 14 Jun
	2025 23:04:33 +0100")
Message-ID: <87tt4bzyge.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0002.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::8) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5029:EE_|CH0PR10MB5065:EE_
X-MS-Office365-Filtering-Correlation-Id: a02314e2-bce3-4aa2-0a90-08ddaf3003c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WOGmIj3XP1lhElf+9ki3WKWf/44xfJrPPeBTtisp7LY6QkKyiKq7rjPxiWIr?=
 =?us-ascii?Q?29GiX6x6AdAKwJNZ15bvkOZsQxMqBDKtw8Nkt/XmmB74lJYm3aBZaLKxNZ+f?=
 =?us-ascii?Q?RMY+A9kQa8oXTLw0XPnJKlhjjTDhIi65Bp0DYxErO2XBkz8MVHr+cRmmNjji?=
 =?us-ascii?Q?KAdqEla4KiBbbwJoORFWxIGDH3Y9QjPkrR07J7yytZbJ3ZRwoh3SYeDk2IkW?=
 =?us-ascii?Q?9k2p0auRBPRltF8VF48VCiDntvVGSsrHd2tgCU/b69kVEBJs1OKZFI4wblYV?=
 =?us-ascii?Q?mIqRk4qUyrpIkcbmIKnX+Nw7EDASoojVDKILfcHfvnVDaLm/TJZDgDYCm/R1?=
 =?us-ascii?Q?CfHNlqDva4ImdaOuBP3Lz+CsNg34jU3H3t6keUMUOjGq9bgg8U/mXGWwUQzT?=
 =?us-ascii?Q?sC7KFuqAjkHDOIERY0azyCjkbuLh6VKDqtENoFN/LkpnYiu8p+QrcV/wQSqv?=
 =?us-ascii?Q?oUda3tnKIZ8/RbJJWgTZNi5bqmO4m55AKpyFaGD2BbO5R0oBUIUNiC5Aydxc?=
 =?us-ascii?Q?Do60Mh/9ztmUn7jtsOGld1fHJs3Pd0+o7hRe/XzyWxnSlcm6YHK89ryz+oj8?=
 =?us-ascii?Q?RElIgLUgixbLJuuEhNPv0nJ+Fu14BiL99r1+Lfs6JN+mmTdMo2k/qavHr9e/?=
 =?us-ascii?Q?QM6toLdDerEgtGpZplKKugLOZo40cmwsNiXH3eXTKD8qgJ5W9SK1yvbNoKQ9?=
 =?us-ascii?Q?22AQYDvMFX10A4TrUrByg/+Sbl6LC2SQFvK6sa2E1RWW0MG/iXd1W1JQjarQ?=
 =?us-ascii?Q?NSjDcuU+eifzlEA7NXQ88FXoCfvFDWATETAM8CMuvn9qsWG/OtGEBBGWYl8G?=
 =?us-ascii?Q?cplfs3dgyiWfpsMtuYUGbrTOnE3wihWjOZOMN+J1yctU0HBGKDqFU2b/gBd5?=
 =?us-ascii?Q?07UuCKFkG9CmrRUYEHTgGVXoSnaD9cHpXkGhBXXyD2XBDKEGRDJhEulesci0?=
 =?us-ascii?Q?jyx63Gr637qL/hEkaR84ve82XHrCmYL9WHOT51xNbJFHONhMjhUAXh1foPTm?=
 =?us-ascii?Q?ynzNf9iMeOMXSx+egoNbJz7rPxAS6HiHzTMX4GWVgD6Ax9zi9wZmre7cxfe5?=
 =?us-ascii?Q?8DdXLmYO8iKaFQHu+Ls8XTxbp1poWb/8f/ZP5cWj/cOle/Ub8AuIbZ3mIJ5q?=
 =?us-ascii?Q?H6UpgLfekbrs27XL4dcpGJVF/ojNOUrwsOzIVjFVve7E/SC7twK6fsfa5N4Q?=
 =?us-ascii?Q?r/k0SC9rqJof0d3mnT8XdE86wFlz8NvrUWA1Z5Tr8J2L5p0pEOqcX55A4bNt?=
 =?us-ascii?Q?CniIL05GWamo5FtqTwe17YBMpYBM73QupBXNbbeOom84yS68oN4tFJOt5YY9?=
 =?us-ascii?Q?vCqXrVjsx1jSnbLy2wtwPaZgYwBaJnfbQCmx0Yqfad2zNf8XLYHbucLELUeK?=
 =?us-ascii?Q?6mTM0FR1ajGw4eL0gvfSOsHus+2yrdLmOUgVij52C30Uf8eovGxw70cjMgMA?=
 =?us-ascii?Q?2PQb4bDRWiA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5029.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2Fb3GO6LWwRoXHG5VMUhfoHbTUvIdOkMqBGxhtj2Aa/ouOk96e3TqY2A7pKU?=
 =?us-ascii?Q?STH+V9swoqH6tAvYrH8XucTq1p3a/6uqX+AFIzN6Mur7MzgXgusVwmP0XFbx?=
 =?us-ascii?Q?FlGOxeBGOshl1Ltk85OnblYmeNTkqyBcG7ezaVonjtQ4Penn/LYdCIXBVC8X?=
 =?us-ascii?Q?GFemqmdMzGSrJjJZAGis1+a8wjr1qwhLL8yiFnGQ0VXdVS3i+FuqQRyVc8cJ?=
 =?us-ascii?Q?Hg1X0cIixEWDj+xQGHypg9cN90gie8m/JqYmtooNUBqqzWcpS/7fpdn3F0tz?=
 =?us-ascii?Q?y+Ks82t0A68okMKumgP7bE/rlroe+R41Y4w8F54PNl7elpeLwPjaxW42W3Jt?=
 =?us-ascii?Q?XaWYlIs0pMsw1Pfcit7ZG5SCScKs+nA1glMwMKVMXXXGrhSgSdQ46wKUokmE?=
 =?us-ascii?Q?wX7CukZu2Onwdch0dxfj/tZ6SAK4U0kDryVfMnTxZsxhvlublhFjnI0SwLXi?=
 =?us-ascii?Q?H4q38gdtUl09I1yqsjPksz3BXIKKLFiM0GOzsXCtkZYXYKj3EWTwGieJHJHz?=
 =?us-ascii?Q?oeNaJDcRr6izrs+zGM4IrQ9MxzKPlMN4/v07cN0gzdxrztttq9/NOjEhoM7t?=
 =?us-ascii?Q?FsD0/oTM0PvEECQGmSuQSkvGYhGlBT83kP5XSI/np8gKRzZrd3ALVqeKFDHN?=
 =?us-ascii?Q?T29cYd5cuUW5R1LMtWWAjOTdzD9zhcP8uNdIisLVKFczZlFJF5LJlJ4iGlCt?=
 =?us-ascii?Q?SCKsh05kfTYT4rICr/iJGUAo16z0eCbDjdZg9ua6NCdmbSJx4qxcklFvDYpQ?=
 =?us-ascii?Q?g9NNNFUUFUcG650JzLdDb+q31jYVJ5kLP3nwUp/7tB6SGLcLQWayjIpqk9rb?=
 =?us-ascii?Q?SPxjVFSiHTRgkyMSy02BIYbe7VS8uBCpdD5ygiF2EeGExozAqHcaGVMeDWfM?=
 =?us-ascii?Q?p89rZ9+FqkSmvviMzlgjXzvym0KCdhk0z1BOvqs8Yu3rDQSKsIQtRRXC36zJ?=
 =?us-ascii?Q?2JKgrd4xJj+WRz/cUVjxGqin796x0/2bQS8kn4d4eofUh2DyjJD0K3wlhvGT?=
 =?us-ascii?Q?6bMbozJft7jjFeZmU332PxTuDGPDunvJ9RcuYAB00Z1+KVjreRT+le0rWtQ+?=
 =?us-ascii?Q?a3QSZKcig84ihvGm4f0KsIMx7wvBe5k+qGWFQvEzfq9AzI3ZOZckuhebxXTh?=
 =?us-ascii?Q?xgjLtnvUBOFZyOr+1TLp2KmMQwrExnPsnxdFV0UcbOIVsONAiIrXrwcGQVcz?=
 =?us-ascii?Q?fchvrKzzFGyrC9g76mUOIcOpiiH9GqDH/EegyPM1RM1QFUAjE7uvZdfosIJq?=
 =?us-ascii?Q?7bJLEiWVr7waI2jGGiuZJh8ZwaWE/adhFWshQ48vNAHQBAUaLVPGZS6TWJqI?=
 =?us-ascii?Q?NX85uZOHLhkhtoSPXyiMtT7tux3t+6c/k/I1iMUbunXMjvpuQ66zjX0MyunJ?=
 =?us-ascii?Q?//d9Ga31rH6Nz/ku/7PD7g6Iw30iwBkwggOsV3mgEdYav9oq7+Snxzwu5t4h?=
 =?us-ascii?Q?kmVFUM0njeXqC9iavfAG91F5CyGLDYrTW9pvRvpkW5W59RxygxaA6RLXEF/W?=
 =?us-ascii?Q?JJ9TJXmdIFXAP2PBQq8HPiPTOX5BwHhIa+y90CuKZjIMkebU0sVHRODl3gIb?=
 =?us-ascii?Q?jWwFiYULcY4JIYaFIeM8H4CITfsbAV5JQNzOG4yXEb6jYqVVOWyzatW29AHj?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	O/JFdpLszBnkH7G9ZT4pVnn7MivSCPYNyg8Qym99LU1YHELNFWqw6xyNTbAW+OI3PQCcBiMPk7jiuFtXBn7IlIsR4r2rbFQjInuX63EqMvK7dExQQjRkYriQD7be5y61HXcOOzweCrH+irD8BUXEDALYRvTEhgXjAwInmiR3U1mJJtgpSuPxGmuZWFW3y6xi56lNHuYByAJf7iXYOwhWpPaVldDh49kMJ/SMfMnkufNZ02ttnWuKMPm1tCnMT8oa6qzMV6VfPOWrFbSiQvClI+0A2oCOL85kI0Ty21oh63aSCH/9JRHMBwcIjNBbUSkycrgqDQGgOnMkoH3odycdrVYdiznkzYoacA62zar/lfNyyQATn+HmjtKZ4AGhN8x8GpjO6J+6gIz/9uqKe8hCdq9kmru9JxjqEhWPdsQgHJKQpJ1x2AR7rZ/o96DoWS+JYhjiA2hcmg0sllSfs3R5P3TWzrr+wL8RBpmDE0nrZawY6w9T5X6Y6iywvU1VPlbLvSaPgAXXcWuWnPAxpDwEKMzB7vg5kgob/cYhR8iacrSxjE169izlL23vi14FK2CYkFKZNLXiN80SXWG8kcQFDFIe38jhoMOB9sW7g3YIIqI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a02314e2-bce3-4aa2-0a90-08ddaf3003c2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 12:51:32.5884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bx5x5ZJkpFJKx+pki312UTf9jIWD8UnLozb2AgEs6Wzyc1OfWZCwbejdNgapqUrFfw9mfrtI2Yi2cUVBT429SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5065
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506190107
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEwNyBTYWx0ZWRfX4BfL+H15ypjX lAKx1SzGCUy0PfUuUq0gPpWkWla63sYgJs/LaCuwc7/QYEho6Evdvh+aFDsBkk0ranhvf1CCFIT fYfkq72bRuoy6d6SCKo0YFX/pEGsBq8jwPMk2zkwPh625k4wunCujRWQlUYszX5fTVD8hKxkcaF
 9A/BuYo6BWHuawHqG54ddaXn5PSLwqw+2TnR9TzcyU+vW8DsczkFLoHrPqAFabqxNEPrt86YzzZ 0KAxpC64szg6xEbZN2zh5NdtZWPEKO8yxYZspjHKnAzDMpsAXKFRhB3SwdglFgm7G98EK15JVai BweQnjSnZZeCxoTltrKcDW16GOH1OgnYs5Xba1qlVraOZmWY6LSut7GKEcg3Y1jRC4nR1Tv5ATF
 lq2o+NtaZxaVuohqui1xsla4N68+PErRF+GhH8Eny29po3NwN7DvPQnnaKz66pCkx56tHo+M
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=685407da cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=H58oC745NLULXfTPEUQA:9
X-Proofpoint-GUID: BfOzCuaQWNH8Xu6irchXSn5knwrkfszb
X-Proofpoint-ORIG-GUID: BfOzCuaQWNH8Xu6irchXSn5knwrkfszb

On 14 Jun 2025, Sam James outgrape:

> Sam James via DTrace-devel <dtrace-devel@oss.oracle.com> writes:
>
>> Nick Alcock via DTrace-devel <dtrace-devel@oss.oracle.com> writes:
>>
>>> On 22 May 2025, eugene loh verbalised:
>>>
>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>>
>>>> Commit 4aec5c9931eb ("dt_pid: pid grabs should be shortlived") made
>>>> grabs short-lived.  No test cases show the utility of this patch.
>>>> Meanwhile, the patch causes roughly a dozen tests to fail on OL9
>>>> when the test suite is started remotely using ssh, closing ttys.  The
>>>
>>> I think this is a consequence of another bug (Psystem_daemon() was
>>> failing to detect that systemd was running correctly on systemd v2
>>
>> (Do you mean cgroup v2?)

Yes indeed. The heat and pollen is ruining my brain :/

$random_related_word v2
