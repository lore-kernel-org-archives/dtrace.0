Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C762A3AC28
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908953; cv=fail; b=Fj4c2B5Sfh2gSGd4it1YT5pW4OLB8XMAstlpFj77ctOqOd8O20MCRxJaQp4NPDMpaENuIuho50gHeaGhS0Zzmqqz+ZhG1p80KE+t1WfoXHRlcUhbkWZDaP6yULg5lr1KXdZ5Vw2JNQ32JqBvXuK7du0B0oUDe2eOXBIrFbaQj+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908953; c=relaxed/simple;
	bh=+DcazITt1NSznr8OX5mv8LBqc1lrMv2qHn1HF5mJDeQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iaQRPy55bIMMCJxKISKsVZbAtjjn2dQUWZCn/7s1qZRkLQItgMr/22NJRzdO9vZxQcJegPBMXjQzRV02Bhdm0dPTrGZ8nxGo5Y9xJUngIy4Y/HsjVpSGJ4s9ZbgQkbWDJ1XOAcV+iUOVIIOGHlFnaKLF3MejzhUpyD76MqhmIYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WAVxGaeG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=S37vMA4G; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WAVxGaeG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="S37vMA4G"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fb4H032625
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=b35/tTSrx0OqUC
	WfN69AGBmhxSGgE3b9D0uCGlD+B68=; b=WAVxGaeGdqZo224docs49VgXNVjBfk
	sAC7nCFdSA8oV82VCX6LNWgLUIwLmdxBTicQW3v10F9+QYYYQLbgwS35o5/GCqBg
	Jm5FzQLz6cDJkFkpXT2a2W1/76RMHmI9851K86SeF7EE++zfYxAGkFDHUFs16W47
	IQ731rHLbx5s/YFqFeQb64EHoypSIKR7cqy/NijKkVVpGNuEmELHiZvSgU4ypLRR
	myfXFEGKl/pzxI3NnypzC1jco68F41ugDdsRaT3diWWXY1LQjf6H1Ua3kUMvAbq8
	73aEiPxdrpD8IasokWTAdc/1MDaBNRXRE3u8/OVXCuRGqe7+pcJ1F8Pw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pukub48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T3pppe010464
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:29 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41894q8hhe-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hq/UDz8Oz/Oj6xiF6t5P63XYMR4kNQbhcKJEH1/cgJ66kuY4LIZvm8QMW23Rcg4Z+rckroac8AIbR8shWs/a/5iKXONMTVqI8+OQ5hel4Zpi5Fe/Cs6v58gXQyHfuM18UEJ0E3sdysoyNnYmbrn+aNRbV3KzpjyftQl8lmzNO2m1BCY3RFtjVH9Nyu9mn0k6LzzFFIGobfyn2TR6XcWTWZqY8j6QcjS7EqXZD5juQmVy5XP+bs6HIljOjMTfPWSdDGE5sMCErDCdjCY6xeLwibgOGJlIBYu160Wi/EWb02hsc05hf0Plwh5vcrKt/xPI388wKL/egYEW0vztgftpTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b35/tTSrx0OqUCWfN69AGBmhxSGgE3b9D0uCGlD+B68=;
 b=c6kmKFy6W0WL380fw+ER+EyFF42KFRLXEAvm1aNVfTlitRUQXQpBGE587UFKDeNVgxYbJ6wabRruJDXTOM2mleZBS25YS+MUsfBeM7i/IFUBio+qlTZm+GQzCyg+WTomqjqW8tfevAtJgMiMAApHz+w+4CcilUqLUN+tGt7WKJiVpM9NlzyeQ2dl7pGEcLTiCUB7SoIv0Q8qvQ3qG8vyWu4MzXXePElkBp4uqDa9vbCEk936MnR4XEcvgPaldByGZyu8uDc+lONiB6QAe/COgg7IXQgu6LEMTW3CtHYafH2TumBDNd93lRgOE4giz9ewTAiLLICMuS0H62qWnNDzxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b35/tTSrx0OqUCWfN69AGBmhxSGgE3b9D0uCGlD+B68=;
 b=S37vMA4GNb3w33hf3llE20URMZx471/hlH9kTWJmKN/QqO/q7dfTFoDqSVp/rn0iui47tl7Yxc0kwxXMBK15Va+1QHpE5LOkUtBy711zux39ZSQ9IyhqgAWu5RdC9wRIlpyqYcm5aBmF5QJ8zXnOHAMg7/RgbKkj09DwOM2iGkE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ2PR10MB7656.namprd10.prod.outlook.com (2603:10b6:a03:53e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Thu, 29 Aug
 2024 05:22:26 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:22:26 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 05/22] Set the ERROR PRID in BPF code
Date: Thu, 29 Aug 2024 01:22:02 -0400
Message-Id: <20240829052219.3234-5-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0002.prod.exchangelabs.com (2603:10b6:a02:80::15)
 To CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ2PR10MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: bdc23ea1-c30d-492b-283c-08dcc7ea9204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?12rjzpT57MdmDZuiKMVtdvZ9E3SCc6kKVsADHTSBBGuFBfWS5OfMmhp/TRZW?=
 =?us-ascii?Q?A/KUiP+KQlkbOMt6yKORpj9aueu431GyM4UyckXBYj+6RZfG9RSNg+1xTayB?=
 =?us-ascii?Q?W0jZ4r50lwQFllYIw19vkNl/3lejjuw6pLkk13mCucgiVi8eHq5j8D5n4aGT?=
 =?us-ascii?Q?HCC8TsP5g5z0GgO3vwB7bDbQulKD2yWQVzAyEhJi9TQWIp23XjZYR6J5A0cT?=
 =?us-ascii?Q?1cym0WDyNom5V6ZPb6ypSUFzwziVx9U4XA0xpuQJL2iRJ9wH8xWXs6fIj35G?=
 =?us-ascii?Q?HvLDx9iKYWjbLYayI0bt9YWfJTtPA4Ejbo+yMN+Rh6PdMvlfJ54ZtjqWpBGq?=
 =?us-ascii?Q?VtzU33o04znlvL1qH8s1O4ShedI98IUfUgfuRAUQ1XUP3vUNpiZBt5riuxvo?=
 =?us-ascii?Q?TBRGzDIWProXKBfGF3Lgf2Z/cKaVHcMTQGItyehHUl2t1XPH1xC8An6DpOfV?=
 =?us-ascii?Q?828+A3tL8gEk+Ju+oLDs9ZmwXLyHjsG9pchYXPwQXDBm+hbC0QQJcy6aMWAn?=
 =?us-ascii?Q?60Uc135jbGETBMnkijqzHGvFkTayYYhNH9CL+Oom0cfDOaNV8SjIoDGrznlC?=
 =?us-ascii?Q?5O+afKSLekLtWLqRqSXUo0nBPtOMe16oKtxU+CplC2hkec1fnBDaTcs/+rYr?=
 =?us-ascii?Q?PAq5to0jIz+l7UhEE70qGF0+CFprqonn+OgBXSY8xfU1msd5bWH32aJNyMeu?=
 =?us-ascii?Q?YjWY04GhD+Nl2JbO2v9baBR9AxOAizO5sDxmuHgWZDdzRjqgvv7S7Q+6Bhlg?=
 =?us-ascii?Q?z6PWPpoDOHD8h/XzHtg8sk2MU1Ri5iBRFVr7Tm1UvfVg4TOKyTDlAPgMShgm?=
 =?us-ascii?Q?5khkUdcOatD1CKeuZXMTUA0KZDAVOD4+U7QATky+tZ++m3r4NX8M1JBTbw/f?=
 =?us-ascii?Q?R+DwJ9b9h/H+HuRuSX6d6N7E7mIhEld6Dp62R4ovtna+YlNaYa6L3OCG6OXh?=
 =?us-ascii?Q?OKMp6OuD28/c8ieaOJd8F9qc9/Wwzgozgiq3T9i30czchsXMtS9NP7WJ89hE?=
 =?us-ascii?Q?WkJeYPKUFJ3g5Uqdka8OBLnjEy402LN/CMGK3P9VO7j5MOJOhVl8Jlyop89T?=
 =?us-ascii?Q?7Uuiu0tdSG8+UslfX4YEs2ihJTVnxmqk2vlPFNR0BEsldDVP0rXrYzFS70vb?=
 =?us-ascii?Q?ivXRjWCcaLVAyYZeMlyPW2MoZq1Lscn31nVMeHJ5Q0hNX2B/oGkh81j7cmms?=
 =?us-ascii?Q?yuBh+a9dkFmrzMcIXkuvckFTlx8A07SMlV+DuRo0B1oJzxSCwxWEBPArvUUM?=
 =?us-ascii?Q?PpvGXhgiGwy5+1hICXuJvJreM0e0YodmyJ4z2BVnI3up9gLAACXBZZa62L+7?=
 =?us-ascii?Q?huc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mrmaV1rt2acm0B+xVwWS8wIqf6jMMsrdXoZxTr+WzkFiyV02CacJ+uxiFwJu?=
 =?us-ascii?Q?Hfzyh5ZAJrjnJBUQftP5m5jPdp1ZMjhizXe8/17a5Z78mMCIxmRQGyeLinma?=
 =?us-ascii?Q?LX5Fgk+B6zh5uOt/L2KwmPvCo+aIf5s/bB3DX4XMroCGc8DaaNvffmlKzOca?=
 =?us-ascii?Q?QLFtd2Jw7h6WqpM+tOs9eTxILPK6rQdkR4YJ70Y9FQdfj1KvFdplj61PUi4n?=
 =?us-ascii?Q?AlCvbrnAqH+MDCaHUOhz+pUAs+x5xbBIy87mt+q/Eus9mwLr3z/ky+/PxnR5?=
 =?us-ascii?Q?gg0Ssyj/k3eXyGNLy9xVj4pqX3+yfPoXZ4hu4yf7EPqUGsSwQ8yM2IcUk04r?=
 =?us-ascii?Q?yMRRd/6FnfJ9m8oUPuZUjY2OamwMlDWYOUI2+XWR7+VK/eQe6oL6nIo94vNd?=
 =?us-ascii?Q?8lskVgsbQAR2aZzwMz06eKfJu5uinpWjrLapMiMai/U2hEBr4Vxu+d00gUj6?=
 =?us-ascii?Q?JJWxyotBPX2eZvLY3VBDSWsX6A7YuGYJtNiaPyQZLQHHdM1K5u+uth8yGrEf?=
 =?us-ascii?Q?dchWxN5rrhvXMrdnBHk5wUN6pGlX7u5w5+8vfm5UkcoPgy7PkFHQzriZCN/2?=
 =?us-ascii?Q?r6lqf3WFfEiglo8eWEw8Gbs1GBHYjd0ErgWLJS1+IO/yWV/AWk5AzWAxS/wl?=
 =?us-ascii?Q?hImS3m1uDARLdnNNBZiQq4LAxOIMPBvwXDJhUCldppXwXnNR93QeNTdR9CzA?=
 =?us-ascii?Q?cMzHESeO/zemQbyUqR+aIbydo1mZu04RnY69TXaWrohZtC+r8GiwVGRoolrc?=
 =?us-ascii?Q?HLgmF/UvpywJd1KoA9OEOTM3ibvxVFoeut1l2e+CGhTIIt8XhUxVJT5nt1Sa?=
 =?us-ascii?Q?7Q6nPvlbRyTS34a0eIX0tBLPn1ClhBxVJFHV9uO9yn+l3Z2aBtXSwJHGCXhG?=
 =?us-ascii?Q?yhKZ8f6We5Jb52eAqDmBDecV65HdpQCdJ+jS3LVjGRmyUXFqpc6dS0n4d89+?=
 =?us-ascii?Q?g9MPVwg6RKA5Hc8tuB71IbYMqTRMjkUf774YVdfs1G8zmb5EoFmgYuw0Uu+T?=
 =?us-ascii?Q?E63WenWPIXgaU6+W+hOt/tkh3xsOD2k0uEdC6WmICiMX6BbZkLBleWKRKTQ0?=
 =?us-ascii?Q?b4ogDIID7iPxLexv9eqV4/8JSERBQ7+AjeqV6jsjN+p5xNfUI3d3/7QTaxLi?=
 =?us-ascii?Q?4bBxxCA7ffsOJun3KxPQXZvW1ps0Wmgxyh4Ism9LQzyQ20fKGPjU8MzsvvHH?=
 =?us-ascii?Q?9CeRwzcjQ7fYyM7cqD2MvOMa+57b0OobyjFdqwJc7X2+4PY/7xCrVbMXu0BK?=
 =?us-ascii?Q?69H/CSAgnv2dXFxX6WUQwdWu4+82FS101kmg2uTSKowFr1g0TXCsAfrt4U0f?=
 =?us-ascii?Q?TYb9CIK3dNlKdU1fnBhY1qGMPuPFE80wC/WEATMnxdkhr8HYlnMOWG202Pby?=
 =?us-ascii?Q?2uRycP/3r921uK+v+H1qyKGlN1ddBk6hh7zsrBWHDXVmKoTX2zyJNjZC6VjN?=
 =?us-ascii?Q?dtEGNrR7JA/FxoN7pG9QuItAQTETZrhueugFikyNSvBvFn0zvm3iSTIAI3nC?=
 =?us-ascii?Q?5UyqBUIF35Y44e+QUkC7i6jVderREoatHUlHpzus6naBqTN5XSmmjjWmWiA/?=
 =?us-ascii?Q?jVAqR1lS48sBN1GWMMuttiXpzUGxZ9GqDuq8OPmD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8OyNnz0uJ1W9codnidTkdOOgZyYFVtvfKgxXXx4wK/EHrpI/28iuiAraCLt0uCaADHBMz8RovQ5V1Wll7q/5W/LaDIB1aAsyOvLkYH3uIRaKTTP9Qlnx7sMSt5TQtpX0bV/xKPqHmc7NHowDwAsM9pLG2844UqzmBcNLp5kHhhjhuEYje1+H39+AEhS6qaJeTVcbDATKwcfW7Bacj6FX5VIJ9UHOC+IajgdeiINcQUbvsfmbYpnu7Uv28Vl5QNFPks8rE4Xw+WQEGvkudmtBu8h9KfCQ0Q+fv6pIfBKcsrAfZg47LAY+OBxi2qFocFikuBSPxCDL/Kd4j9XiJDPQ5vDyjFtU4EXdsJkSdwXiQmVtbEH6MfRDjTq52Z6oI4v7efGEEB1QY00TGoHr03kXsYzCLkxxMpwAwbliCIvKuBIo044nOJ1At+Q3RfR1HidczAgEhD+MYl0Nv8DOP5NXfdcAEqY9u12e+enhtrIJoSn5aP46HI+KJYIJu5/wm4Uib+XfGDl6UHyYWOJxG3XEGXYQbW+r19a6ZEpHtpwwX2AWg/soCdQbnbWHgOMP3LJbkvJe69ywwGd0Ldz737uRbfcu7+Uv/ctiHelMNIkpeeA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc23ea1-c30d-492b-283c-08dcc7ea9204
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:22:26.6586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0K7WmU/WVnjEyKmY0AfIQ3foInOTXhRVIoY3qJxUYenKmb0zT3sJS+FfZZhiDrzQCz+4u5oIT3cjD5nDrJGfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7656
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: wm94FgUwFwMp5zCBZeyg-eQ744L_cliI
X-Proofpoint-GUID: wm94FgUwFwMp5zCBZeyg-eQ744L_cliI

From: Eugene Loh <eugene.loh@oracle.com>

We use the fact that the ERROR PRID is always 3.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 bpf/probe_error.c                         |  3 +++
 test/unittest/builtinvar/tst.id_ERROR.d   | 32 +++++++++++++++++++++++
 test/unittest/builtinvar/tst.id_ERROR.r   |  3 +++
 test/unittest/builtinvar/tst.id_ERROR.r.p |  4 +++
 4 files changed, 42 insertions(+)
 create mode 100644 test/unittest/builtinvar/tst.id_ERROR.d
 create mode 100644 test/unittest/builtinvar/tst.id_ERROR.r
 create mode 100755 test/unittest/builtinvar/tst.id_ERROR.r.p

diff --git a/bpf/probe_error.c b/bpf/probe_error.c
index c8ddcdfa..ee1a1793 100644
--- a/bpf/probe_error.c
+++ b/bpf/probe_error.c
@@ -26,6 +26,7 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
 			     uint64_t illval)
 {
 	dt_mstate_t	*mst = dctx->mst;
+	int		oldprid = mst->prid;
 
 	mst->argv[0] = 0;
 	mst->argv[1] = mst->epid;
@@ -34,7 +35,9 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
 	mst->argv[4] = fault;
 	mst->argv[5] = illval;
 
+	mst->prid = 3;
 	dt_error(dctx);
+	mst->prid = oldprid;
 
 	mst->fault = fault;
 }
diff --git a/test/unittest/builtinvar/tst.id_ERROR.d b/test/unittest/builtinvar/tst.id_ERROR.d
new file mode 100644
index 00000000..59021c60
--- /dev/null
+++ b/test/unittest/builtinvar/tst.id_ERROR.d
@@ -0,0 +1,32 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION:
+ * The id in the ERROR probe is 3.
+ *
+ * SECTION: Variables/Built-in Variables
+ */
+
+#pragma D option quiet
+
+tick-1s
+{
+	/* trigger the ERROR probe */
+	trace(*((int*)0));
+}
+
+tick-2s
+{
+	exit(1);
+}
+
+ERROR
+{
+	printf("id of the ERROR probe = %d\n", id);
+	exit(0);
+}
diff --git a/test/unittest/builtinvar/tst.id_ERROR.r b/test/unittest/builtinvar/tst.id_ERROR.r
new file mode 100644
index 00000000..95974abe
--- /dev/null
+++ b/test/unittest/builtinvar/tst.id_ERROR.r
@@ -0,0 +1,3 @@
+id of the ERROR probe = 3
+
+-- @@stderr --
diff --git a/test/unittest/builtinvar/tst.id_ERROR.r.p b/test/unittest/builtinvar/tst.id_ERROR.r.p
new file mode 100755
index 00000000..884b43f4
--- /dev/null
+++ b/test/unittest/builtinvar/tst.id_ERROR.r.p
@@ -0,0 +1,4 @@
+#!/usr/bin/gawk -f
+
+# Drop the line with run-dependent PRID for profile probe.
+!/error on enabled probe ID/ { print }
-- 
2.43.5

