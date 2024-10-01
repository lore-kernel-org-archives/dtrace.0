Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1231CB508
	for <dtrace@lists.linux.dev>; Tue,  1 Oct 2024 17:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727802790; cv=fail; b=L4afhBH3dE+cWFWlP/TxZ4iVeUnRWRTw/CDUP5C8ZRbFrM4a1xgvCjH6QzcGQBUQi6XYFyN4p7FtxbK6R7x3559TKzdpkasvZauhSTl2ABiwfPyRiX/Wld9pe4Adzxug1jWqZyVOeeISvkla3ODAyu+TVXIvPXDfTcK5G//+4Wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727802790; c=relaxed/simple;
	bh=wv3GZd5ff5nakGLJz2zPnNV8BZUJbzXbcnyEHeIUQKU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bQUtUV++wnCJTSjeEPmOq0b/Q4bK7adL9HQZnBHpKGqcDoRCNSHcpsNtvi+GhWqrLqIj9l5DAf24oGCzbGH/xvXw6OV55LYMajKvDOMs7EnkpoNnYodYZC6oeE4zaQsy2ORFnRjvtZF663Rj9MT5kclc7c2l53rYDHbGVN9Glh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TZf26Uvk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=s7ux1tf0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TZf26Uvk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s7ux1tf0"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491HBcFt032034
	for <dtrace@lists.linux.dev>; Tue, 1 Oct 2024 17:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=8dmmfAAijnJuKLg6dWbz9hzeL3/eHzGeJ7iznnrABYU=; b=
	TZf26UvkaC+zeytAYyGYsuwr96KXfZ5zmcZ5lFbfbt4obGJgdkVpqmJ/wm2NhSwz
	xND0BFE018ox7PUK1aihRmOPEOxyzmPTNY6TnSCAxYXR0EKdsGM6iTfek7V6ckcJ
	rrHFNcCNSkR3uYXR0TCQlcVYWJJKEc2HkBv5UQlMJTchKsnBtAV9q+DKdz+xorly
	WJ/uwbRwdeWeBiOeCGOj8v1V/amHxYuhTDlwr5Go8/KdQH5w6bHzSIDLpEPj2vGu
	vE9d2R2ao/qnlN2njrUFif8rA4eNjLktewnjA7nQGSs2u/q0PgV2MDmFH4a9wvML
	5W5NfiCcszKznXQkEBWf1A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41x87d6tmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Oct 2024 17:13:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 491GFfXg017337
	for <dtrace@lists.linux.dev>; Tue, 1 Oct 2024 17:13:05 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41x887tu6m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Oct 2024 17:13:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xV/6mJusqa4k7PHqVK3LQHsW/3zKIgb/AL5I6VYTy31C8LYVV1Vl7XqqhD+2dYT8B+skBjwlv/PkVPXBitE90tUnq95a+RoTHf/DkcE7Rj7JRBHAiEm9vHIPNR7OUw2sqRz5lj42K5Cin+DD0qGtLaA75E2czpjCVPVZ+IgMi15cfcPSfjn4OOvJ8xnyYZH3GtIs+AZtBsJEpUoZx3pWIZIgXk3qj87jWDMjxgGKTGJ4dwx8UpiSCGglbVgz3eaiQT9gmcF2WdDisW9nwPR653lYh4DJe0s7DQma61zP4p1yJbBW3qK8PYlAeGNzHewMlYBbT969lOHM6tPl9VRKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dmmfAAijnJuKLg6dWbz9hzeL3/eHzGeJ7iznnrABYU=;
 b=JgZ14IOXqV75Lj514PSkzaiJ8GcvrwvdjYcdOibbEII6aM77BtOiBxHHtu+fIXwdtN3IvQ1NJkz0BFmtpTkLNgBh4s0pUdy9XpIvwj9JwJRXUW8OHxR9LxIWeErDR7HLSbp1Yar5bcvolH17o2t0BhX33GHc/NZMx/9Wt25NRDPgW0LLd/QCI81YSIuwaAQfgZDZ7YZp3XN8OPugYBMOj+fXbdS7VMMzXNLbWzMnWFD0PNEQTXNK+QElpydULpCA8WdxiEVIS/1TYnfciMUfSoehWspnWUWpwZ8oA7O+n1MPayN6nFWxpKkhI7Ht7IxwJAIW3sQlfwMU0ohSp1KEBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dmmfAAijnJuKLg6dWbz9hzeL3/eHzGeJ7iznnrABYU=;
 b=s7ux1tf0ZSNFwLIgEyHEfSl1DF9wYU833O9yJSYEaZsg/s7/G13EbkZC9GuBWre2bB9FouToa5Wr+fhwAF48U934v7SINKDUSCgfgwjdZlaSJuQ14cgmCxlrL8sK8qLLHVwSzmPJuF9utWlGL/ZdkP5hdQabO4xiqPd5yOu/SiA=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by BN0PR10MB4887.namprd10.prod.outlook.com (2603:10b6:408:124::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Tue, 1 Oct
 2024 17:13:02 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.8026.013; Tue, 1 Oct 2024
 17:13:02 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] ctf: rejig with better builtin object detection
Date: Tue,  1 Oct 2024 18:12:51 +0100
Message-ID: <20241001171253.426429-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241001171253.426429-1-nick.alcock@oracle.com>
References: <20241001171253.426429-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0670.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::16) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|BN0PR10MB4887:EE_
X-MS-Office365-Filtering-Correlation-Id: 77989b8c-80ae-419d-0028-08dce23c4e28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?02okd0V2KYnBhSK1drP8o9GlJP4l4itk8tlmyIbaaUNC/wmArycdufhXWF5f?=
 =?us-ascii?Q?zVzjPMZrf63FB+wGxTxRkX3wSa2byu4eWFmjewA7OMnmouZVpFA2eLF0Ak/V?=
 =?us-ascii?Q?4GPBZVbvYyW8jTBQPfjyXSG30S5TJb0ReCXLn+Ttin/PTNEZ1ysFyYfbp8IX?=
 =?us-ascii?Q?mDbVvM0YJx9LrDRmU78QutGhC9NZT8ffp+MMYKYxp83hsIqK+94w8GCTeBfb?=
 =?us-ascii?Q?nNjd+WrGnIs3qKQKu/8bJEQsmYwlz2sMG3vP2o7ghTssDmH8HcJC/S+YQ0Fx?=
 =?us-ascii?Q?f/1A2SATgHR6PMtL/yh6+K2gOuvSbmj/jUuHIMDzxKli4SB5QHRorEzcK6ct?=
 =?us-ascii?Q?F/PAskPiV4lA4FC3woTbq1kcjZB6ND7smJ35Al59+BZvB2cqZGZS4ZXrjMjs?=
 =?us-ascii?Q?FFb3BwRLi+4JncGz8Y7b2CWe8RY0Aas1a6vsqjreQGzKfmNZMMW3CwisvIOe?=
 =?us-ascii?Q?T+rvb3GEsU9+A7pZvO2QzHBfyy/Ia1enYUbqp9KBc0ImI8wXVHkCH7rBk/7f?=
 =?us-ascii?Q?u88ZICl0a5MeiM+/o6ykCAutwWtOuVrNgAKAR0N3BhwU0bFfq4q9LqXaAbig?=
 =?us-ascii?Q?C8vdte9Z+IfgnxvNgbrJUVE5Qo0Wyobbarm91Eazt0YU25NepkiGEg/zzVcd?=
 =?us-ascii?Q?xysFHhQyEfnWDlr7KvWVcZD5zYug8TB28q4XgN0XfiQgZMuIieMMdIF/Ci3z?=
 =?us-ascii?Q?EA1AdvMfaW7vUWg5ZGpGIC6+X3s809T0FvhAABtIfFfmteTxT//+jtQcVrCj?=
 =?us-ascii?Q?3WKZM8BLneLSZ19ArrTpXMv5pHsUfprhtikEKG0HO89sxTKqUXcjI2uNWuqQ?=
 =?us-ascii?Q?nDpYHeoQn5GAiY7mjl75PiP4EQLbok/EShiAd6pdoPQEdQJLiCw3qYeiPk2M?=
 =?us-ascii?Q?sBuNcq+GyahV5AI0LOqdMM1403XsBRAX0YhvQBO4shjDWOfX3/7GN+rMw0Ca?=
 =?us-ascii?Q?f+scIUuH9r+V5LChlt0bepYxvu1TPH+I3EnPrvAAhmiXEzjx3F56i3AG7W5C?=
 =?us-ascii?Q?Fs7MHyJ67FsZPZBnAwR5pcyoew9lzsj/n/+5DgFYiihWWtIC6+2SlP6muROn?=
 =?us-ascii?Q?hvJAlgweBFsRKSrYt79+c3DKKcnSUtbCuh431qoOCoINrJLFWCnnUw8IKXaQ?=
 =?us-ascii?Q?Kx6jZ5CQ1wcKnYa8egX7ER/k9A23NsneIfha+Kuir+pxcbSVekEeThEGc2TO?=
 =?us-ascii?Q?RSsg/Ra8OfSssX5nSTTrHdbmwaz8OLLOFbQ0vyMvTnbYsqIl9UeqRIcKdnmG?=
 =?us-ascii?Q?3DZQ9BgEmfXFFcmeGP1JO+iie0hkQJaTGoU+ZUmoelC/os1C9rcavW2ioGZx?=
 =?us-ascii?Q?Qqned+KwwHse8e3e7iirm/z8ltW2Hu3fv+dEESLR3Er8wA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mI1V28t2TarUlWCldFP4+zhTZPdMxsq1aNN/z0Eq0Hxqc7k9yAcdTbmHyoc9?=
 =?us-ascii?Q?hYPVLX0OYA10aMynIMdnD8ogTdru0JADXq1IgnxhFksS0XCBeoTw9S1sW9AQ?=
 =?us-ascii?Q?yRt5ZrxejdXFJxOFoJ+G+Ukk+/Ryd3swpskRcjWl5snoRcOTcrCJVOR5aqtS?=
 =?us-ascii?Q?UMhnzl6uxrzhYLZZbou2deBhM53+aX/s8VAoykBnKQS0qWhwWQmuGZpLx/WH?=
 =?us-ascii?Q?UENlHj+Dkmdg5x9gKD0ErlQiqZTXlKz22qQg5/BVv46arJDLD/IlDltQgB6K?=
 =?us-ascii?Q?HdStxCoCWXWzX9yu2khm0+9YZCgHaZDABrbvXvXXVF5QkDXAkJtfkaM3tvx/?=
 =?us-ascii?Q?8tITpEL1mcXTRHIo41BySOviKbktkZsVfD3rQviNE7gl2sb8T/1Kr9wbdGGt?=
 =?us-ascii?Q?VJyeMvTO1NWP/5Efay/qvzDOuyHPCBVTbaAc2qwcpEXANzf+YP+7pDO7njS4?=
 =?us-ascii?Q?kS3QfGVtKLI7CHbzGG22b6hv5ync1TsQu4z5d3fNdt1fmXxyPPZqdx71vNY6?=
 =?us-ascii?Q?Po564YldDqCtEjDMaOCn9eg25MhILayPAjw/XsRQY4KxF/0Wmse/NE5bpxu/?=
 =?us-ascii?Q?8CWwW80o+eWfZQ8U7nzfAE5V/hdkF/vORPVmNs2wLvB67PhiKAd2YgsZLM4M?=
 =?us-ascii?Q?+4uRFeJvtnTLc6O0ChswDACkJVh1Szxzsn/vgrZ/VvrFtk9EpQNGdYkKEBzP?=
 =?us-ascii?Q?8RNwgyT/OKLYLvbsYlcL7kcyqY4JQICHhEHepvBky2hE57QA85Q7Lfk0+LxV?=
 =?us-ascii?Q?2KHSbJvQh5gVb/imnUM9WpCloxBUIB/J5HJhbx1dVZVfzfYS/yWmXKZD2gK5?=
 =?us-ascii?Q?LzT9x0nkVemu6VjbTdy0Fcsq26pkTAuTi+BjYV8DSrWKvzRHkSywfZfKeNYD?=
 =?us-ascii?Q?NXFyX3l4eIg5cCW/jnAJW9X0bZOCBdwWQpQvLuQ8f0ARgg+U/hNrv8fiPLEa?=
 =?us-ascii?Q?SvpsL7hvEUR2P3xlkltyh5GCgNtcEU86PL0pN9klucEHA5wzQUJKmd7z07h9?=
 =?us-ascii?Q?GHxstxp+uASaktNru6ct8ZZJq0XSH4Z8W98rdNX9U9sRYsknziDPnwCIdcuq?=
 =?us-ascii?Q?09tNaJyfhFziPtSZohMsJLPxVrNpXC025M7iD16iLhWAoz7uwwTKrvGA6Cv4?=
 =?us-ascii?Q?lMwYRlVjh+Gq39aYDTVwTIBrlxRi4JZfYgV6vRL+W0zsfv36i0U+ZdAlZDJn?=
 =?us-ascii?Q?1fZrous8D7cm4nx1Nm6L+CN+MDyUjzb8CPprvpck8x0XIM2eQTJiVIf8beC2?=
 =?us-ascii?Q?FBa6oP3mxqAEAhbPWkslcvKUoZGDi9KCEirqWXcVyBKWCMm57BeJkKHgcRmZ?=
 =?us-ascii?Q?2MKGtX2Bw3XByePHMq64aN9DF8dEbBSg5YxnPclprPWixfFAIFomfncvpl3p?=
 =?us-ascii?Q?SK1zh2NWwrlNbtxfUiwWEBcpU5yslh0WrCoOcawvvvBqnIbiNkjR7Qyn7pUm?=
 =?us-ascii?Q?GwDINFQZTFKBoRGlPeqGyyBegR4cyqc2MvyeEhiTdraDOAhCrIuNOe/GWccj?=
 =?us-ascii?Q?LVd/Wir9Mt1tMqeFouFIgx7SHvNv3kLdNWxSefXZ5pN4KXBzYDCoiYxX2IIX?=
 =?us-ascii?Q?z7EW5w3UoqUTZIdL8caCTpERjmOiI6gfrGjkBB/2GJxl478CTrDp5SZ/vXb1?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3XHY7bIBwEklqlZI6wNUevttuBcbs/xAK/3XgJNh2Dcj8j3X+FYqgcvX9FJDxDZ9NcB7VQwptf3jdFXKGREWcbE7v0NNEpjh4kgsk+5cbUtVPCjW/hxdszVnOAv7F2vbTK0Mbre+ePvABYyxeKmeBDCS0O+vLUbIPTndytCEiySnGZgJ+tXiZtu9omXGUPE6s4q4qq4g4wh3y/5qynqvSdd/XMgz8bLhBVsKLssJEncBTNzqvQ3KIxJW9QvT0dVes/XQRJUGq23GcfvgsH1X8XnY/30b5ydTq00Gl4U73rb98LeZv/vMyVVcHlv2h+hV2vmLgK34qYKbhInqO2EqjEya02HG1hnS1dAYUAju7JtewZDtNQn616UkChIOZ22avF2dxy8HGXnF4zhtzgInTSmU+GDpFT0iBZqVRnIXzU4I36qkDQrrl8lSJ/NDF0LuFxTR4CHGqFqmtX7IkQEUEur5YNr8K9lmN/oc74gyRvGK8T8V36hPqhHNwIjpUSjNGoA9J5Y8Ud9s+EmvurGBd8/JpaNt1up7Cy6yXJqaZLl3l3s+Yzudp8ylpqlbqJg2A9ZTjCPMWINhiQJIK8Jo8pDzAc4FPq/26p0IFUgdgco=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77989b8c-80ae-419d-0028-08dce23c4e28
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 17:13:01.9656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bqjt//3JTGDjlipcTx31A/GpYPJ11e2H/LSD7iQDXAWbRkRq+5NzZ25npshY182JtQ7bX4cZtd9QiXB/36PESQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4887
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-01_13,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2410010110
X-Proofpoint-GUID: cmqNGAqSlKaIy5d837mvn2MIY5J6dikt
X-Proofpoint-ORIG-GUID: cmqNGAqSlKaIy5d837mvn2MIY5J6dikt

Drop reliance on modules.builtin.objs: instead, compute it by consulting the
KBUILD_MODNAME arguments recorded in the .cmd files associated with each
object file that ends up in vmlinux.a.

Every input compile line has a KBUILD_MODNAME, including those that aren't
tristate: so filter it down using the module list in modules.builtin.

Constructing this list ourselves lets us simplify its layout in ways that
makes life easier for the iterator in modules_builtin.c (now renamed to
module_objnames.c), reducing its length by about forty lines.

Doing things this way also lets us avoid relinking the kernel when doing a
make ctf.  It will go wrong if people start deleting .*.cmd files from the
kernel build tree while leaving the object files behind, but I'm fairly sure
this will break other things too, so we can probably rely on this not
happening.

(POC: still being tested.)

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 scripts/Makefile.ctfa                         |   2 +-
 scripts/Makefile.ctfa-toplevel                |  41 ++--
 scripts/ctf-module-objnames.sh                |  35 +++
 scripts/ctf/Makefile                          |   2 +-
 scripts/ctf/ctfarchive.c                      |  14 +-
 .../{modules_builtin.c => module_objnames.c}  |   2 +-
 .../{modules_builtin.h => module_objnames.h}  |   2 +-
 scripts/module_objnames.c                     | 160 ++++++++++++++
 .../{modules_builtin.h => module_objnames.h}  |  20 +-
 scripts/modules_builtin.c                     | 200 ------------------
 10 files changed, 235 insertions(+), 243 deletions(-)
 create mode 100755 scripts/ctf-module-objnames.sh
 rename scripts/ctf/{modules_builtin.c => module_objnames.c} (54%)
 rename scripts/ctf/{modules_builtin.h => module_objnames.h} (54%)
 create mode 100644 scripts/module_objnames.c
 rename scripts/{modules_builtin.h => module_objnames.h} (64%)
 delete mode 100644 scripts/modules_builtin.c

diff --git a/scripts/Makefile.ctfa b/scripts/Makefile.ctfa
index 2b10de139dce..1bcdeda375dd 100644
--- a/scripts/Makefile.ctfa
+++ b/scripts/Makefile.ctfa
@@ -35,7 +35,7 @@ ifdef CONFIG_CTF
 ifeq ($(KBUILD_EXTMOD),)
 ctf-modules := $(shell find . -name '*.ko.ctf' -print)
 quiet_cmd_ctfa_raw = CTFARAW
-      cmd_ctfa_raw = scripts/ctf/ctfarchive $@ .tmp_objects.builtin modules.builtin.objs $(ctf-filelist)
+      cmd_ctfa_raw = scripts/ctf/ctfarchive $@ .tmp_objects.builtin .tmp_module.objnames $(ctf-filelist)
 ctf-builtins := .tmp_objects.builtin
 ctf-filelist := .tmp_ctf.filelist
 ctf-filelist-raw := .tmp_ctf.filelist.raw
diff --git a/scripts/Makefile.ctfa-toplevel b/scripts/Makefile.ctfa-toplevel
index 210bef3854e9..29416c9c07ce 100644
--- a/scripts/Makefile.ctfa-toplevel
+++ b/scripts/Makefile.ctfa-toplevel
@@ -12,27 +12,24 @@ ifeq ($(KBUILD_EXTMOD),)
 
 # This contains all the object files that are built directly into the
 # kernel (including built-in modules), for consumption by ctfarchive in
-# Makefile.modfinal.
-# This is made doubly annoying by the presence of '.o' files which are actually
-# thin ar archives, and the need to support file(1) versions too old to
-# recognize them as archives at all.  (So we assume that everything that is notr
-# an ELF object is an archive.)
-ifeq ($(SRCARCH),x86)
-.tmp_objects.builtin: $(vmlinux-dirs) $(if $(KBUILD_BUILTIN),bzImage) FORCE
-else
-ifeq ($(SRCARCH),arm64)
-.tmp_objects.builtin: $(vmlinux-dirs) $(if $(KBUILD_BUILTIN),Image) FORCE
-else
-.tmp_objects.builtin: $(vmlinux-dirs) $(if $(KBUILD_BUILTIN),vmlinux) FORCE
-endif
-endif
-	@echo $(KBUILD_VMLINUX_OBJS) | \
-		tr " " "\n" | grep "\.o$$" | xargs -r file | \
-		grep ELF | cut -d: -f1 > .tmp_objects.builtin
-	@for archive in $$(echo $(KBUILD_VMLINUX_OBJS) |\
-		tr " " "\n" | xargs -r file | grep -v ELF | cut -d: -f1); do \
-		$(AR) t "$$archive" >> .tmp_objects.builtin; \
-	done
+# Makefile.modfinal.  Make sure that all lines that are not absolute paths
+# start with a ./ (for consistency with .tmp_ctf.filelist).
+# We sort it after the fact to eliminate duplicates (there are quite a lot).
+.tmp_objects.builtin: vmlinux.a $(KBUILD_VMLINUX_LIBS)
+	$(Q)for archive in $^; do \
+		$(AR) t "$$archive" >> $@.unsorted; \
+	done; \
+	sed -i '/^[^/]/s,^\([^\.]\),./\1,' $@.unsorted; \
+	sort -u < $@.unsorted > $@; \
+	rm -f $@.unsorted
+
+# This contains a mapping from module name to object file name for all
+# objects named in .tmp_objects.builtin.
+# Extract possible module names from the command-lines used to
+# compile the modules, filter them by the set of actual built-in modules
+# in modules.builtin
+.tmp_module.objnames: .tmp_objects.builtin modules.builtin
+	$(Q)$(srctree)/scripts/ctf-module-objnames.sh $@
 
 ctf: vmlinux.ctfa
 PHONY += ctf ctf_install
@@ -41,7 +38,7 @@ PHONY += ctf ctf_install
 # built if not already done, since we need the .o files for the machinery
 # above to work.
 vmlinux.ctfa: KBUILD_BUILTIN := 1
-vmlinux.ctfa: modules.builtin.objs .tmp_objects.builtin
+vmlinux.ctfa: .tmp_objects.builtin .tmp_module.objnames
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal vmlinux.ctfa
 
 ctf_install:
diff --git a/scripts/ctf-module-objnames.sh b/scripts/ctf-module-objnames.sh
new file mode 100755
index 000000000000..4fc8f24b8888
--- /dev/null
+++ b/scripts/ctf-module-objnames.sh
@@ -0,0 +1,35 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0+
+# Produce a file mapping module names to object file names for all built-in
+# modules in the kernel.  Used by ctfarchive.
+
+set -e
+
+# Translate e.g. ./lib/zstd/common/entropy_common.o into
+# ./lib/zstd/common/.entropy_common.o.cmd, and extract the module name from
+# that.
+
+sed 's,^\(.*/\)\(.*\)$,\1.\2.cmd,g' .tmp_objects.builtin |\
+    xargs grep -o -- '-DKBUILD_MODNAME=[^ ]*' | \
+    # Translate e.g. ./lib/zstd/common/.entropy_common.o.cmd:
+    # -KDBUILD_MODNAME='"zstd_common"' into zstd_common
+    # ./lib/zstd/common/entropy_common.o, and sort the result so the same module
+    # always occupies consecutive lines.
+    sed 's,^\([^:]*/\)\.\([^:]*\).cmd.*-DKBUILD_MODNAME=."\([^"]*\)".*$,\3 \1\2,' | sort -k1 | \
+    # Accumulate filename portions for the same module into one line.
+    awk -F ' ' 'BEGIN { mod=""; objs="";}
+                $1 != mod { printf ("%s %s\n", mod, objs); mod=$1; objs=""; }
+                { objs=objs $2 " "; }
+                END { printf ("%s %s\n", mod, objs); }' > .tmp_possible_modobjs
+
+# Filter out the maybe-module names from this list, and sort them.
+sed 's, .*,,' < .tmp_possible_modobjs | sort -u -k 1b,1 > .tmp_possible_modules
+
+# Filter the list of possible modules by the list of modules actually in the
+# kernel, then use that to exclude non-modules from the list we computed
+# earlier.  Trim off trailing spaces, to help the iterator in
+# modules_builtin.c.  Complicated a bit by the need to trim off the leading
+# kernel/ from modules.builtin.
+sed 's,^.*/\([^/]*\)\.ko$,\1,' modules.builtin | sort -u -k 1b,1 | \
+    comm - .tmp_possible_modules -12 | join -j 1 - .tmp_possible_modobjs | \
+    sed 's, *$,,'> $1
diff --git a/scripts/ctf/Makefile b/scripts/ctf/Makefile
index 3b83f93bb9f9..cddf9710ef55 100644
--- a/scripts/ctf/Makefile
+++ b/scripts/ctf/Makefile
@@ -1,5 +1,5 @@
 ifdef CONFIG_CTF
 hostprogs-always-y	:= ctfarchive
-ctfarchive-objs		:= ctfarchive.o modules_builtin.o
+ctfarchive-objs		:= ctfarchive.o module_objnames.o
 HOSTLDLIBS_ctfarchive := -lctf
 endif
diff --git a/scripts/ctf/ctfarchive.c b/scripts/ctf/ctfarchive.c
index b91e48e5d46f..eac15b5b707b 100644
--- a/scripts/ctf/ctfarchive.c
+++ b/scripts/ctf/ctfarchive.c
@@ -5,7 +5,7 @@
  * deduplicated CTF derived from those object files, split up by kernel
  * module.
  *
- * Copyright (c) 2019, 2023, Oracle and/or its affiliates.
+ * Copyright (c) 2019, 2024, Oracle and/or its affiliates.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -19,7 +19,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <ctf-api.h>
-#include "modules_builtin.h"
+#include "module_objnames.h"
 
 static ctf_file_t *output;
 
@@ -242,19 +242,19 @@ static void suck_in_lines(const char *filename, void (*func)(const char *line))
 /*
  * Pull in modules.builtin.objs and turn it into CU mappings.
  */
-static void suck_in_modules(const char *modules_builtin_name)
+static void suck_in_modules(const char *module_objnames_name)
 {
-	struct modules_builtin_iter *i;
+	struct module_objnames_iter *i;
 	char *module_name = NULL;
 	char **paths;
 
-	i = modules_builtin_iter_new(modules_builtin_name);
+	i = module_objnames_iter_new(module_objnames_name);
 	if (i == NULL) {
 		fprintf(stderr, "Cannot iterate over builtin module file.\n");
 		exit(1);
 	}
 
-	while ((paths = modules_builtin_iter_next(i, &module_name)) != NULL) {
+	while ((paths = module_objnames_iter_next(i, &module_name)) != NULL) {
 		size_t j;
 
 		for (j = 0; paths[j] != NULL; j++) {
@@ -268,7 +268,7 @@ static void suck_in_modules(const char *modules_builtin_name)
 		free(paths);
 	}
 	free(module_name);
-	modules_builtin_iter_free(i);
+	module_objnames_iter_free(i);
 }
 
 /*
diff --git a/scripts/ctf/modules_builtin.c b/scripts/ctf/module_objnames.c
similarity index 54%
rename from scripts/ctf/modules_builtin.c
rename to scripts/ctf/module_objnames.c
index 10af2bbc80e0..4e3d1d6c6389 100644
--- a/scripts/ctf/modules_builtin.c
+++ b/scripts/ctf/module_objnames.c
@@ -1,2 +1,2 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#include "../modules_builtin.c"
+#include "../module_objnames.c"
diff --git a/scripts/ctf/modules_builtin.h b/scripts/ctf/module_objnames.h
similarity index 54%
rename from scripts/ctf/modules_builtin.h
rename to scripts/ctf/module_objnames.h
index 5e0299e5600c..b22906bff02f 100644
--- a/scripts/ctf/modules_builtin.h
+++ b/scripts/ctf/module_objnames.h
@@ -1,2 +1,2 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#include "../modules_builtin.h"
+#include "../module_objnames.h"
diff --git a/scripts/module_objnames.c b/scripts/module_objnames.c
new file mode 100644
index 000000000000..bd7267710c8e
--- /dev/null
+++ b/scripts/module_objnames.c
@@ -0,0 +1,160 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * A simple .tmp_module.objnames reader.
+ *
+ * (C) 2014, 2024 Oracle, Inc.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "module_objnames.h"
+
+/*
+ * Read a .tmp_module.objnames.objs file and translate it into a stream of
+ * (module name, object file names).
+ */
+
+/*
+ * Construct a module_objnames iterator.
+ */
+struct module_objnames_iter *
+module_objnames_iter_new(const char *module_objnames_file)
+{
+	struct module_objnames_iter *i;
+
+	i = calloc(1, sizeof(struct module_objnames_iter));
+	if (i == NULL)
+		return NULL;
+
+	i->f = fopen(module_objnames_file, "r");
+
+	if (i->f == NULL) {
+		fprintf(stderr, "Cannot open builtin module file %s: %s\n",
+			module_objnames_file, strerror(errno));
+		return NULL;
+	}
+
+	return i;
+}
+
+/*
+ * Iterate, returning a new null-terminated array of object file names, and a
+ * new dynamically-allocated module name.  (The module name passed in is freed.)
+ *
+ * The array of object file names should be freed by the caller: the strings it
+ * points to are owned by the iterator, and should not be freed.
+ */
+
+char ** __attribute__((__nonnull__))
+module_objnames_iter_next(struct module_objnames_iter *i, char **module_name)
+{
+	size_t npaths = 1;
+	char **module_paths;
+	char *trailing_linefeed;
+	char *object_name;
+	char *p;
+	char *one_object;
+	size_t j = 0;
+
+	/*
+	 * Read in all module entries, building the next arrayful of object
+	 * file names for return.
+	 *
+	 * The first word of an entry is the module name: the second and
+	 * subsequent words are object file names (there must be at least
+	 * one, and may be more than one).
+	 */
+
+	/*
+	 * Reinvocation of exhausted iterator. Return NULL, once.
+	 */
+retry:
+	if (getline(&i->line, &i->line_size, i->f) < 0) {
+		if (ferror(i->f)) {
+			fprintf(stderr, "Error reading from .tmp_module.objnames file:"
+				" %s\n", strerror(errno));
+			exit(1);
+		}
+		rewind(i->f);
+		return NULL;
+	}
+
+	if (i->line[0] == '\0')
+		goto retry;
+
+	trailing_linefeed = strchr(i->line, '\n');
+	if (trailing_linefeed != NULL)
+		*trailing_linefeed = '\0';
+
+	/*
+	 * Slice the line in two at the first space: the elements past it are the
+	 * object file names.
+	 */
+	if (strchr(i->line, ' ') == NULL) {
+		fprintf(stderr, "Invalid line in .tmp_module.objnames: %s\n",
+			i->line);
+		exit(1);
+	}
+
+	p = strchr(i->line, ' ');
+	*p = '\0';
+	p++;
+	object_name = p;
+	free(*module_name);
+	*module_name = strdup(i->line);
+
+	/*
+	 * The array size may be an overestimate if any object file names
+	 * start or end with spaces (very unlikely) but cannot be an
+	 * underestimate.  (Check for it anyway.)
+	 */
+
+	for (npaths = 0, one_object = object_name;
+	     one_object != NULL;
+	     npaths++, one_object = strchr(one_object + 1, ' '));
+
+	module_paths = malloc((npaths + 1) * sizeof(char *));
+	if (!module_paths) {
+		fprintf(stderr, "%s: out of memory on module %s\n", __func__,
+			*module_name);
+		exit(1);
+	}
+
+
+	while ((one_object = strsep(&object_name, " ")) != NULL) {
+		if (j >= npaths) {
+			fprintf(stderr, "%s: num_objs overflow on module "
+				"%s: this is a bug.\n", __func__,
+				*module_name);
+			exit(1);
+		}
+
+		module_paths[j++] = one_object;
+	}
+
+	module_paths[npaths] = NULL;
+
+	return module_paths;
+}
+
+/*
+ * Free an iterator. Can be called while iteration is underway, so even
+ * state that is freed at the end of iteration must be freed here too.
+ */
+void
+module_objnames_iter_free(struct module_objnames_iter *i)
+{
+	if (i == NULL)
+		return;
+	fclose(i->f);
+	free(i->line);
+	free(i);
+}
diff --git a/scripts/modules_builtin.h b/scripts/module_objnames.h
similarity index 64%
rename from scripts/modules_builtin.h
rename to scripts/module_objnames.h
index 5138792b42ef..94fa48498313 100644
--- a/scripts/modules_builtin.h
+++ b/scripts/module_objnames.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * A simple modules.builtin.objs reader.
+ * A simple .tmp_module.objnames reader.
  *
- * (C) 2014, 2022 Oracle, Inc.  All rights reserved.
+ * (C) 2014, 2024 Oracle, Inc.  All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -10,8 +10,8 @@
  * (at your option) any later version.
  */
 
-#ifndef _LINUX_MODULES_BUILTIN_H
-#define _LINUX_MODULES_BUILTIN_H
+#ifndef _LINUX_MODULE_OBJNAMES_H
+#define _LINUX_MODULE_OBJNAMES_H
 
 #include <stdio.h>
 #include <stddef.h>
@@ -19,17 +19,17 @@
 /*
  * modules.builtin.objs iteration state.
  */
-struct modules_builtin_iter {
+struct module_objnames_iter {
 	FILE *f;
 	char *line;
 	size_t line_size;
 };
 
 /*
- * Construct a modules_builtin.objs iterator.
+ * Construct a module_objnames.objs iterator.
  */
-struct modules_builtin_iter *
-modules_builtin_iter_new(const char *modules_builtin_file);
+struct module_objnames_iter *
+module_objnames_iter_new(const char *module_objnames_file);
 
 /*
  * Iterate, returning a new null-terminated array of object file names, and a
@@ -40,9 +40,9 @@ modules_builtin_iter_new(const char *modules_builtin_file);
  */
 
 char ** __attribute__((__nonnull__))
-modules_builtin_iter_next(struct modules_builtin_iter *i, char **module_name);
+module_objnames_iter_next(struct module_objnames_iter *i, char **module_name);
 
 void
-modules_builtin_iter_free(struct modules_builtin_iter *i);
+module_objnames_iter_free(struct module_objnames_iter *i);
 
 #endif
diff --git a/scripts/modules_builtin.c b/scripts/modules_builtin.c
deleted file mode 100644
index df52932a4417..000000000000
--- a/scripts/modules_builtin.c
+++ /dev/null
@@ -1,200 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * A simple modules_builtin reader.
- *
- * (C) 2014, 2022 Oracle, Inc.  All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- */
-
-#include <errno.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-
-#include "modules_builtin.h"
-
-/*
- * Read a modules.builtin.objs file and translate it into a stream of
- * name / module-name pairs.
- */
-
-/*
- * Construct a modules.builtin.objs iterator.
- */
-struct modules_builtin_iter *
-modules_builtin_iter_new(const char *modules_builtin_file)
-{
-	struct modules_builtin_iter *i;
-
-	i = calloc(1, sizeof(struct modules_builtin_iter));
-	if (i == NULL)
-		return NULL;
-
-	i->f = fopen(modules_builtin_file, "r");
-
-	if (i->f == NULL) {
-		fprintf(stderr, "Cannot open builtin module file %s: %s\n",
-			modules_builtin_file, strerror(errno));
-		return NULL;
-	}
-
-	return i;
-}
-
-/*
- * Iterate, returning a new null-terminated array of object file names, and a
- * new dynamically-allocated module name.  (The module name passed in is freed.)
- *
- * The array of object file names should be freed by the caller: the strings it
- * points to are owned by the iterator, and should not be freed.
- */
-
-char ** __attribute__((__nonnull__))
-modules_builtin_iter_next(struct modules_builtin_iter *i, char **module_name)
-{
-	size_t npaths = 1;
-	char **module_paths;
-	char *last_slash;
-	char *last_dot;
-	char *trailing_linefeed;
-	char *object_name = i->line;
-	char *dash;
-	int composite = 0;
-
-	/*
-	 * Read in all module entries, computing the suffixless, pathless name
-	 * of the module and building the next arrayful of object file names for
-	 * return.
-	 *
-	 * Modules can consist of multiple files: in this case, the portion
-	 * before the colon is the path to the module (as before): the portion
-	 * after the colon is a space-separated list of files that should be
-	 * considered part of this module.  In this case, the portion before the
-	 * name is an "object file" that does not actually exist: it is merged
-	 * into built-in.a without ever being written out.
-	 *
-	 * All module names have - translated to _, to match what is done to the
-	 * names of the same things when built as modules.
-	 */
-
-	/*
-	 * Reinvocation of exhausted iterator. Return NULL, once.
-	 */
-retry:
-	if (getline(&i->line, &i->line_size, i->f) < 0) {
-		if (ferror(i->f)) {
-			fprintf(stderr, "Error reading from modules_builtin file:"
-				" %s\n", strerror(errno));
-			exit(1);
-		}
-		rewind(i->f);
-		return NULL;
-	}
-
-	if (i->line[0] == '\0')
-		goto retry;
-
-	trailing_linefeed = strchr(i->line, '\n');
-	if (trailing_linefeed != NULL)
-		*trailing_linefeed = '\0';
-
-	/*
-	 * Slice the line in two at the colon, if any.  If there is anything
-	 * past the ': ', this is a composite module.  (We allow for no colon
-	 * for robustness, even though one should always be present.)
-	 */
-	if (strchr(i->line, ':') != NULL) {
-		char *name_start;
-
-		object_name = strchr(i->line, ':');
-		*object_name = '\0';
-		object_name++;
-		name_start = object_name + strspn(object_name, " \n");
-		if (*name_start != '\0') {
-			composite = 1;
-			object_name = name_start;
-		}
-	}
-
-	/*
-	 * Figure out the module name.
-	 */
-	last_slash = strrchr(i->line, '/');
-	last_slash = (!last_slash) ? i->line :
-		last_slash + 1;
-	free(*module_name);
-	*module_name = strdup(last_slash);
-	dash = *module_name;
-
-	while (dash != NULL) {
-		dash = strchr(dash, '-');
-		if (dash != NULL)
-			*dash = '_';
-	}
-
-	last_dot = strrchr(*module_name, '.');
-	if (last_dot != NULL)
-		*last_dot = '\0';
-
-	/*
-	 * Multifile separator? Object file names explicitly stated:
-	 * slice them up and shuffle them in.
-	 *
-	 * The array size may be an overestimate if any object file
-	 * names start or end with spaces (very unlikely) but cannot be
-	 * an underestimate.  (Check for it anyway.)
-	 */
-	if (composite) {
-		char *one_object;
-
-		for (npaths = 0, one_object = object_name;
-		     one_object != NULL;
-		     npaths++, one_object = strchr(one_object + 1, ' '));
-	}
-
-	module_paths = malloc((npaths + 1) * sizeof(char *));
-	if (!module_paths) {
-		fprintf(stderr, "%s: out of memory on module %s\n", __func__,
-			*module_name);
-		exit(1);
-	}
-
-	if (composite) {
-		char *one_object;
-		size_t i = 0;
-
-		while ((one_object = strsep(&object_name, " ")) != NULL) {
-			if (i >= npaths) {
-				fprintf(stderr, "%s: num_objs overflow on module "
-					"%s: this is a bug.\n", __func__,
-					*module_name);
-				exit(1);
-			}
-
-			module_paths[i++] = one_object;
-		}
-	} else
-		module_paths[0] = i->line;	/* untransformed module name */
-
-	module_paths[npaths] = NULL;
-
-	return module_paths;
-}
-
-/*
- * Free an iterator. Can be called while iteration is underway, so even
- * state that is freed at the end of iteration must be freed here too.
- */
-void
-modules_builtin_iter_free(struct modules_builtin_iter *i)
-{
-	if (i == NULL)
-		return;
-	fclose(i->f);
-	free(i->line);
-	free(i);
-}
-- 
2.46.0.278.g36e3a12567

