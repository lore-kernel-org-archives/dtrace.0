Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD6014F131
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 16:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725036836; cv=fail; b=aT3kZqFq1aKZyOCqcQeTclFwfiC2clEnqaCvrgTEhPxA/benG39+j+SryqDDa7scenqmxhKlu9XjmIHSZpIDdJGX68qLOXJlbZ53H5y7KQPq13lpiy6pa5GdZzdyTqs3G5Tln83laqnzD9yZ+87Taycof20MlXSMNqn1Mjq9IYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725036836; c=relaxed/simple;
	bh=wCLgLbU66C9kgaVAWZUpQkdpwaIL2mK+uyVmEGylv0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hscfmemFI/rP5hZT2Jv/MDu2TRNPf/SIXe0f63gMAb76feVtv4d0TadZyq/yVo8RpqpmFiv3/WnZIiiHr8646REOXl9t62jTKqDm89/hpmnJ40miHbe5qJUPUNJQMnlqoqs8ErLkUeK0bZBQNfImH2/idQAJ5h+9XehhXgw2wZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gV1uJzx3; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BIa/P8K5 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gV1uJzx3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BIa/P8K5"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UFnxHm021833
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 16:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=9Y5tAc31tTg6e0W0rr+PvNQOelb3A8cHSV0Ia73u2Ug=; b=
	gV1uJzx3+9YWKo8ilp+1zjedfQ6XX3vBDNvZJT78OLn9vdKSWfvPIGkzLsxstoBY
	koNYboZhHTfx0WV8YsGVC64uezDf1KQFeKkqieoLjdpZSaZ7wWiltqBHw2sxp6Ro
	Ab0KaGWpyJqt7MwHkfhPbR6X3BF8oM8pDAASPexLz2c9YXZqCMqrQr3Z9ARRytrQ
	0EnbNyw7mvQNafQPNgOPGnnQVzcT7VhmFDDLwG+PAJk5XZZIy4rPKORLAmlNOugS
	8oMvrIcnznEVjPgh8QQnmn3Pfuc2KUYUYd8IaUn5lXvBf0WMR8W8XnLVOAhxyQK8
	4cX8df1PY1RFkjrzhkPmCQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41baa912g7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 16:53:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47UG1pCG036544
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 16:53:50 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2049.outbound.protection.outlook.com [104.47.55.49])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4189jptjh3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 16:53:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQWSiJCDa/b664h/KURLuhcYk7wLR7aR9H+4Z4KEtojzfdrYSeolb5WagS5ok8IXN5iMw6M0UAnirlt/5HrAyjboXNTuIBSB44ENaNKil1q8iZ34oY6mXflVBXUP75/XrNlBN+LGti/buyZuIjkTcfx1ycD+Vg6oN108LLcnJjwF5v0acu6+bRLLVhtLAkJDiXiqwTXJCfe8HxfOw9Gbs4r84hNAPAHu76Mlsk6MQf++FigotI3bq2zNaD2UoXJmTYTNeegluOtlqdY5kt92/nHeuN31AVhyGQ6Hd9F19Uzea7aUSyj6mUxvhtzBSZyrLo4KjEuoydObn0R8h/FW1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnkl8YxO1gwpqPu7lUqNVv9xZvU3zMPf9mgvidi4blg=;
 b=cnrUXa5ALlHzmWRIMq1iynip+4nJv0xuLMrhN8XIbYkSJWNSE3NfEhcIyQ9kRFVNR7KTI9+xCJfIvb4wwpNC0EDE0gsWSpXV9j4WTcuPoFLIO1q6jiOgNKlVu9Rsp8shDNrZJQVNmyt6P9eBtxUgAKBUJd2MM52+a+PExXX+yxDduXDq+CYae1utODdmLg8nY6rxR9jDLd5FvnAtr8EMqCW5hqe6VwVL3ohty8h6XkGkeJUYWws3QUinD5uchI8Qg5U0aG8KBS1x4bj/GAP54l3QBG6/DUcBzLnsB6R6Krij33zxK6Vd0TOGlfLUwY74h8b/EcJA4zq/yZMQUkJ3ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnkl8YxO1gwpqPu7lUqNVv9xZvU3zMPf9mgvidi4blg=;
 b=BIa/P8K5pXJZHGXjSOgEAr1ESMSAYy43f7WrNzKH+zSvHZFhxL0nIWdUMFd5ttA49yv7Golmripa0hfKg2eZZf2n6xrJyo5LUkld+H80EwbxWDdmXlDiRy2oLIwDMq+cvrV6EyM2X/nZqa8yWnas5vabsorHGzR2HjC7Xvjo8YU=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by IA1PR10MB6098.namprd10.prod.outlook.com (2603:10b6:208:3ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Fri, 30 Aug
 2024 16:53:46 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.012; Fri, 30 Aug 2024
 16:53:46 +0000
Date: Fri, 30 Aug 2024 12:53:43 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 31/38] Fix dt_pebs_init() call
Message-ID: <ZtH5F7Y9xZ8yykFM@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-12-eugene.loh@oracle.com>
 <ZsyRbgnYtFelMhM8@oracle.com>
 <9ddcccb0-6ab3-c1ec-5394-4793ac187273@oracle.com>
 <ZsyrTYUHihmORaU5@oracle.com>
 <9a232070-92da-3d5c-8337-52286fe66c4c@oracle.com>
 <Zs+Tm8LO6naCCQz3@oracle.com>
 <01996fde-0909-57a0-3178-2158b377f53a@oracle.com>
 <ZtEtwnkc2gWT3zwD@oracle.com>
 <10a8f685-b3e6-bf99-0579-c47408dd39ec@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10a8f685-b3e6-bf99-0579-c47408dd39ec@oracle.com>
X-ClientProxiedBy: BL0PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:91::22) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|IA1PR10MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dd26916-b84a-4c2c-4182-08dcc914502d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?zfmLfj2TfhKVFnDmt0RRRLps5YRzX//2qC49+YBCUGPGB0T53nlLIqxSjE?=
 =?iso-8859-1?Q?SQmOvQuviwrtAFqSetxqv6erkh7MNx+TgLVLA9kiIrHf4vcjnvB/SBNv+C?=
 =?iso-8859-1?Q?XS3T4Q3WUcEU3UIVdFc4Q3gMxWPiB4tIYbBT1zkcoaV5gFwWJNpPwzC6wd?=
 =?iso-8859-1?Q?wf1DBswM9SMGeEOObeQD9ynCc3ofB5nIghE0Go6pfWl0t2nQrUCF9z8LXp?=
 =?iso-8859-1?Q?i2P3rhT1RuQiiuoSveuVN1fftejRVYQsA9kRDNKSDvTuK0ul+EHq7kirzW?=
 =?iso-8859-1?Q?d4N7YrITmLiG+LxMNMqyyEHklkaWXm86tW4cCqDztZvmaPTjT0XAz/vHC0?=
 =?iso-8859-1?Q?5sVo/Xlsh1krsOi/BESujvyIyb5OqwLKDCOscVFmHgChgQmCsj9ZnzwkqI?=
 =?iso-8859-1?Q?HOcwhxU3Dur5emhMbYp1wmAgoSHtdWiEYmFXSKJ4I+9n0LcgZ4a12dnvcx?=
 =?iso-8859-1?Q?bPLcI2i+siczexQdUUsK4i3rWsvrCzPEETREzuLdWtMrtTuFN0ciAUNyGA?=
 =?iso-8859-1?Q?4dnG1B4v5zQE/02Q70bFfNgcz0Ta67Nj37OdfmYVt3tXXx0np0pZw0PG0l?=
 =?iso-8859-1?Q?VYrQp9eIoZT51XIK7IW+Rwc1LTljtf22xQkgIQmU6LJQi4f/OE/j/V2kBB?=
 =?iso-8859-1?Q?hWDtwUxLh+SwkvVC9xXMATdnU+mw/cWigfvOUmRtVcJ64vV7PRF4BpJn4l?=
 =?iso-8859-1?Q?N9iWTESrWw5JT2DrylZ+cy87gieEDCP1Q3P0XzAk0crt1Velnqo5drphMj?=
 =?iso-8859-1?Q?d22g5paE3A4AN6cqKdxPA7uPb80qBUoyhWIoF6A1Uf0Up7pp/8nQTutIDc?=
 =?iso-8859-1?Q?8feSGo3T3GmbzVqZNROCYwDmqxb1itgub+1dO+GEB2zBmjHm14dYc3WNZj?=
 =?iso-8859-1?Q?0wcSTT62TnNDlCNZ9WuwV7jGTrcRxLH9snghIcdbYLg7x0XPgvgtbcU+Bl?=
 =?iso-8859-1?Q?KGliQv8FWeXsjlRllMkorzuNzw0Ik0jCtBcTrcQoVPiZm0Kvoz80z4dhdt?=
 =?iso-8859-1?Q?/J6zNsiBQ3scAEH3jAPBxyIakUcq8Imk7nfN0R40t+CvwTjG09c9NYx252?=
 =?iso-8859-1?Q?KKkHKD9OojJF3tnKyLBbU71Zj3RsK8eZrBLCmXoIdvXBM6IiVWNo9OmrXJ?=
 =?iso-8859-1?Q?Ir23Ik7Fn6tXaTgvTlgR9LO1MHNy9D53UUQz6qMqLrA56K6ua0/HLudiLs?=
 =?iso-8859-1?Q?MjxKWeAfPPIoChEfoWHLbFjZUJrflc2QmgCEMOSZvD64kchZmvaGuHxjX2?=
 =?iso-8859-1?Q?HHxhRf5667sDb/eaxwMFWr+5SC077avU7kHGBo1FapUyhqnOJrHpj5blLU?=
 =?iso-8859-1?Q?iGhX8lmw3bK1+oKyR520pQ/nbb1GGB4mWpwT9AH/gufiNfZDuQ0rU/LkaT?=
 =?iso-8859-1?Q?k12JWKN1M6/aUIpgDBqUiFCjkXak9ZordYpUtCrwu2fgsz5/pk50M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?kYoEFBNLJCRT3C6WnFmYT+EZPB2/dMKgF0kgWXQy497Buf6CtT4nXDkVUz?=
 =?iso-8859-1?Q?/jjSBivfBsOfVrZF23esHUb8Ujtfh+7YgR1ylcb67Elusojg2Vk+C/jydY?=
 =?iso-8859-1?Q?EJO07W/ysnxDkgPYBl13KcdFzmhLqi9c6hepy9JIi8e1f5D4MFhbV8oAhI?=
 =?iso-8859-1?Q?Z+Rv/DGNNO1/hb5Kw2REmIVBEk9AP6uBZEdPuiGVZsj962Rc+3/VXbH9RO?=
 =?iso-8859-1?Q?FmiTSZSqYFqw1Ti9jUbYROGiDB0RtrADb+0Ity6LVkWDjz75GrYeNpEAeC?=
 =?iso-8859-1?Q?vU+/+hjecxLX4WJjJPFVFEIxR6kUTraps8W4QsAXVM/QtL3gajdZCXlbh3?=
 =?iso-8859-1?Q?yZXOUOhAaldHHLdmtTA0vLr2o3ScwS8bLrUXaAue9mCqTHwxUNoxip8djD?=
 =?iso-8859-1?Q?zCFK/ZZJTpGTHcV2h37hIdyxZ9o23ICKwkRWe6Hplr+1Ie25iFKMkKd1L5?=
 =?iso-8859-1?Q?luPutYJrimyfpY7mJrrLNKFj1TYiNtrnMLARhpkYgRsQ3cJTbeuM+M67fk?=
 =?iso-8859-1?Q?n+mENsIQ0ZlmPdl67rkJaoxCGf9wCYAEXhe+0PU7mZznT253JWzmPyw3PV?=
 =?iso-8859-1?Q?/NUIrba1sJZY7Fp/4yNHk2AqR6T1yiSq73u1pq4QKc/KVhZRqvcS/Hhni7?=
 =?iso-8859-1?Q?+3h2E99Vj+nm4KF8LizSu6x5uvvFTibUqI4kn7pIImYY1KQEVAfY9ZUVby?=
 =?iso-8859-1?Q?9pzQvV4IUoeRNT2zP5j7t0yYvB+plj0f/hG99AeWpDNn3jwVThJbrl+GOA?=
 =?iso-8859-1?Q?/JfnVAExv+Q9kb2pd+VRwuCawNkGDBHyhGMQlYEVcLyMm391k/n2FXPHCY?=
 =?iso-8859-1?Q?75NiSpxsR6sQT8wR39mM1IuD8XL8WFvqnB44OecxiKTxPP8w+yTAkOUnhn?=
 =?iso-8859-1?Q?OxHomgFiVRQDiCW2HGp9yg9jopI0lt1ZYxKakCGgaUfnlA/GL57rGJaWEI?=
 =?iso-8859-1?Q?XRGi2h6LuoWOfqyQOWu3/CfvbIVdq/JDQqUZgLmu/+n0U1eBcYannL7SAq?=
 =?iso-8859-1?Q?EfNPlxUm+iJt06TUbCIGSpB+IBmrdRPom3qhYftFJzUWXJe7/pplgpieS8?=
 =?iso-8859-1?Q?JcA+/kYX+nJetJzBweFisF6Kmh7eY943MpWy1eLR0rN6Me2Lm/YvaQO3PD?=
 =?iso-8859-1?Q?Iv6ZkGeSp8do+NYrgoxLzDJ0/4WxYd2zOjpnOISduO9aF99LGf20WXCpiG?=
 =?iso-8859-1?Q?q9j8GyPG12+H1uuz02Wi8w870+BDBWn72owrv3nMLIA/3mjXFqxuK5d5Al?=
 =?iso-8859-1?Q?yNJEVEHktGdwlmKQgHtsSS048SU1hXhG6c9ajIOozsgXiyFKzG+AsvSrxF?=
 =?iso-8859-1?Q?Y6nozRDfeS9REDptg+fVGZ8uFsT/6ZgQLJks1dvQXGI2nOL5mqDmOEklZx?=
 =?iso-8859-1?Q?/DG01Em85g55ydlNXnPXBNpZ0o0PxBFLHzB3VYZCsNoSPJd/sXcKeyzc5D?=
 =?iso-8859-1?Q?IH6YGJrrDzXJX0EZgZdmpDiOXHZZUzsV8DjlN6Dfx1MpO/yqnbn17Fw42I?=
 =?iso-8859-1?Q?BJllBYE4FkOEZ4ssghpY2q5HTEF4fAcN65ShRWS/qtaEF9xiABcKlTK28N?=
 =?iso-8859-1?Q?jmttXwh0Jnb1/HjrBhtgPmgAHl/Nl89fhRDQGO6AASGG43iqtMzqYwfRxz?=
 =?iso-8859-1?Q?dAFq4LS0mk2wLX82JGDhudn8a/GjzTMrC4KeJNWcMyVs2tInyDKvPNMg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	plj0J4eGTSxhwbvgNcsVHuK4g/2PCXPbtbcnKSIHXalOUArsexoT+LXvCL6cgSvws+rQ/DqTROXKWSkupI2sUQl1X7ENW2l/aJzdmrtLWHCM/9Pk9OiyrWM+F9FmK3hqbBDg6xDOb6VJGHc06a9hJmf2CZe/pp+KHYRZ2QgPW6c19ooU+bcRxhIYpYOgCedSiaxk4PFeP2/BgrF6tduZFTRB0DgqfsGC/DqpAlVvlHCLOz8DkrOwaOCM7Sik8ACbMCXwjPaW+rDFY/B8EzWSBUWOQl2AQUsa+0qMq1U54LkOwKuEn2u+ahf0NA6Ri6fOgMxOhjZl12MZy8bfiGe03EWW4p1//DscPoI7iTcUY4rTT5nY86mX9H6N/PjXjuwOdqL3VlATAw1z/V5rIwDym7Fwgu3pVGIPs5OIXFMwEeDL+a+WUKU21ey5sS3b+ijHmYUjWTM70us1TYvAJUWSCjLoPsQTqrh6FiCaEIAhvEVnEG350fufsukX4Eg2vcSyDAi9/JIl5GZaPtUPrMTZc7F9JVaLW27y7WcxLyxRarLqwvQXMo9H364txZ86BUHild/5cV0mvlH6N1HuDjx/xH4YFYgFkHTw0mAasK1taL8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd26916-b84a-4c2c-4182-08dcc914502d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 16:53:46.2380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00HM9ZIN0H//77EiPwuUqnFOgIhwuN6wXO1s9WTp9bF/3bUr9UxZFacdBB5uQ8whA13DhzA8jCyuANiuLq4y0ORXcDzpOaDnRGi2ZHx1pEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6098
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_10,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408300129
X-Proofpoint-GUID: 9J2mLEF5jad19bfylO-uYNiqfzljvPsh
X-Proofpoint-ORIG-GUID: 9J2mLEF5jad19bfylO-uYNiqfzljvPsh

On Fri, Aug 30, 2024 at 01:42:38AM -0400, Eugene Loh wrote:
> So do you have a proposal for what the new semantics for bufsize should be? 

I believe the semantics of a user-specified bufsize should be as follows:

 - If the bufsize specified by the user is less than the minimum buffer size
   required to store the largest trace record, an error should be reported.
 - If the bufsize satisfies the minimum requirement, the implementation must
   ensure that it is round up (if needed) to satisfy the perf ring buffer
   size requirement (size needs to be 2^n * pagesize, for n = 0, 1, 2, ...)

Point 1 is clearly debatable but follows the principle that you cannot put
something bigger into something that is too small to hold it.

> (And, why not simply ignore bufsize?)

Because we want users to be able to tune the size of the tracing buffer, which
can affect performance in terms of how quickly trace data is generated versus
how quiickly it is consumed.  It interacts with things like switchrate.

> On 8/29/24 22:26, Kris Van Hees wrote:
> > On Thu, Aug 29, 2024 at 08:54:46PM -0400, Eugene Loh via DTrace-devel wrote:
> > > On 8/28/24 17:16, Kris Van Hees wrote:
> > > > On Wed, Aug 28, 2024 at 04:57:43PM -0400, Eugene Loh wrote:
> > > > > On 8/26/24 12:20, Kris Van Hees wrote:
> > > > > > On Mon, Aug 26, 2024 at 11:42:25AM -0400, Eugene Loh wrote:
> > > > > > > On 8/26/24 10:30, Kris Van Hees wrote:
> > > > > > > > This patch goes against the intent of the code, as far as I can see.  The
> > > > > > > > point of performing the size check prior to increasing the buffer size was
> > > > > > > > to enforce the limit on the size that was explicit set by the user.  Then,
> > > > > > > > if that size was sufficient, then DTrace is at liberty to increase that
> > > > > > > > size to a whole multiple of the page size.
> > > > > > > > 
> > > > > > > > But if I were to insist that a buffer can only be 24 bytes, and 24 bytes are
> > > > > > > > not enough to store a single trace record, DTrace should report an error
> > > > > > > > rather than increasing my bufsize setting on its own.
> > > > > > > The point is that DTrace *does* increase my bufsize setting on its own.  Why
> > > > > > > should DTrace complain about my setting when it's going to ignore my setting
> > > > > > > anyhow?  What value does the pre-existing behavior offer to DTrace users?
> > > > > > > Are you saying that DTrace should not resize?  That it should honor the
> > > > > > > user's bufsize?  No more resizing (to page size or whatever it wants)?
> > > > > > The main point of this code was to retain the bevhaviour that DTrace provided,
> > > > > As far as adhering to legacy behavior... quite simply, we do not. We do not
> > > > > set the "principal buffer size" to bufsize.  Further, any legacy resizing
> > > > > behavior is, if I understand correctly, to go smaller than the user
> > > > > requested;  we do the opposite.  Looking to the legacy behavior for
> > > > > precedent is pointless.  The situation is that we are unlike legacy behavior
> > > > > in fundamental respects, opposite in another respect (automatic resizing),
> > > > > but consistent in some impractical and useless respect.  That consistency
> > > > > strikes me as small consolation.
> > > > You can look at this from different angles, yes.
> > > > 
> > > > > There is no documentation to change;  the documentation is already wrong.
> > > > > This patch was intended as a step to making the behavior something that was
> > > > > describable.  Clearly, trying to hold on to a legacy buffering model has
> > > > > produced a byzantine situation in the current port, which treats buffering
> > > > > very differently.
> > > > Yes, but if you want to go that route we ought to go all the way, and not some
> > > > interim solution (see below).
> > > > 
> > > > > Perhaps we simply disagree on those points, and this patch is DOA. But the
> > > > > patch points out other problems as well.  E.g., the min computation wasn't
> > > > > even right and error checking was wrong.
> > > > Let's do this as two patches:
> > > >    - one that ensures that the computation is updated to the current
> > > >      implementation changes and is correct
> > > >    - one that provides for increasing the bufsize to be the smallest multiple of
> > > >      pagesize to fit the largest trace record needed for the tracing session
> > > > 
> > > > I don't think that checking the rounded up bufsize against the minimum size
> > > > makes any sense if you are going to increase the specified bufsize anyway.
> > > > Might as well increase it to fit the minimum size altogether.
> > > I'd like to understand this proposal.  Are you saying:
> > > 
> > > *)  Determine the min size (correctly).
> > Correct.
> > 
> > > *)  Round that up per perf_event requirements (2^n + 1 pages).
> > No, round up to nearest 2^n.  The extra page is allocated automatically by
> > dt_peb_open().
> > 
> > > *)  Ignore the user's bufsize setting.
> > Well, no.  The bufsize setting is not ignored.  We just change the semantics
> > a little (in view of the new implementation) to be a mechanism to allow the
> > user to tune the buffer size, but within certain limitations.
> > 
> > > I'm fine with that (given that we do buffering so unlike the legacy
> > > implementation and will not be honoring the user's bufsize value anyhow),
> > > but I just wanted to be explicit about ignoring the user's bufsize.
> > We do not ignore the bufsize as such.  But the extent to which the bugsize
> > can be tuned is limited by the implementation.  The bufsizw setting cannot be
> > less than the minimum requirement (and you prefer to not complain about that
> > and instead just increase the buffer size).  And its value must be a 2^n
> > multiple of the page size, so it will be rounded up to the nearest acceptable
> > value.  But that is therefore still controlled by the user's bufsize setting.
> > 
> > > > > > which is that if a user explicitly requests a bufsize that is less than the
> > > > > > minimum required for the given trace programs, an error is reported.  That is
> > > > > > a mater of being consistent (even if it has no practical application that I
> > > > > > can see).  Tests from the existing version failed because this was not being
> > > > > > done right.
> > > > > > 
> > > > > > As far as functionality, as long as the bufsize is large enough to hold the
> > > > > > largest trace record, DTrace can (and needs to) ensure that the buffer size
> > > > > > is a whole multiple of the page size because that is required by the perf
> > > > > > ring buffer imlementation.
> > > > > > 
> > > > > > So, DTrace only increases the buffer size to the required multiple of page size
> > > > > > if the user supplied bufsize is at least large enough to hold the largest trace
> > > > > > record (or if no bufsize was explicitly specified).
> > > > > > 
> > > > > > We could opt to change the behaviour of the bufsize opton to always round up to
> > > > > > a whole multiple of page size, but that is a deviation from the original
> > > > > > implementation and thus is something that would need to be documented, etc...
> > > > > > 
> > > > > > Aside from the computation of the minimum required size needing updating when
> > > > > > patches (e.g. the USDT changes) modify the layout and size of the trace records,
> > > > > > I do not think that the existing code is wrong.
> > > > > > 
> > > > > > I am certainly open to a feature change to make bufsize always be rounded up as
> > > > > > needed, but that is not a bug fix and I think that ought to be its own patch
> > > > > > (along with documentation changes etc).  And it might need some more discussion
> > > > > > because it brings up the question why we wouldn't just simply always increase
> > > > > > bufsize to be the smallest multiple of the page size to accomodate the largest
> > > > > > trace record.
> > > > > > 
> > > > > > > > On Thu, Jun 27, 2024 at 01:38:57AM -0400, eugene.loh@oracle.com wrote:
> > > > > > > > > From: Eugene Loh <eugene.loh@oracle.com>
> > > > > > > > > 
> > > > > > > > > The function had a few issues, mainly with its comments,
> > > > > > > > > ranging from typos to incorrect descriptions of behavior.
> > > > > > > > > 
> > > > > > > > > The function has only one caller.  The enforcement of a
> > > > > > > > > size minimum was problematic in a number of respects:
> > > > > > > > > - it was missing 4 bytes
> > > > > > > > > - it was enforcing the minimum before the size was
> > > > > > > > >         increased by the caller
> > > > > > > > > - it was checking dt_pebs_init()==-1,
> > > > > > > > >         missing errors with other negative return values
> > > > > > > > > 
> > > > > > > > > So change the function to accept a minimum and change its
> > > > > > > > > return values.
> > > _______________________________________________
> > > DTrace-devel mailing list
> > > DTrace-devel@oss.oracle.com
> > > https://oss.oracle.com/mailman/listinfo/dtrace-devel
