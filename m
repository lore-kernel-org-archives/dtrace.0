Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC362701C0
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 22:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754950415; cv=fail; b=FEgDCQeuLj7zAf131gK5Qx2aD3rK4Hc2LF0RbHib+GnXF3DH8th82XpHhFWHDroPbvS0eO1FX2yw9+bgfiAmY2T0Q3pAGID6nQGkoP0LIip4B5hv/wRvvSEZOH3aicp5oAd9zY2ycpxPycdBffHYtlpbMThIC7IeesTiovWOBfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754950415; c=relaxed/simple;
	bh=W3uyYBg7nDHSZA2X8pBphG09tV3tNOO+Sz4msDiAIy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iLrioB9a6VZtQ5i2lOHV5LQsXDiMgdXno1sBXFUaV7d82kWT1FbEf/97B3WUbD8CGbRVBKHIP0S2AzSTAEJ4IsEUnlNSZyWTmOXh1OTYWgJSWLuiSvbjQ49fX/1KMf1jHSOP42TkvYSGWPsg9deC4UglCfr4Djb3S9JWsAnHLTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=E6c/uwfA; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oG/fpTlg reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="E6c/uwfA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oG/fpTlg"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BKu4bB009745
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 22:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=c/4QBk3TOZCC3Km7y9J07q/WwbHDZXnr0ro7mmcaGJI=; b=
	E6c/uwfA+Li12/hiuiPx7SYsV4qL90wV1LZskRFALfuY8TWt8AuT7eKEQyiwVqBX
	DnlcLR5tDeQNIWUjUQ+q+FF/mmlt5Bo/SVkgXRtoVDM9FTVzQjFkX4jbha1eS+iG
	faJdkmf+JdkuJwawHxZf+W30nO0a072EA+JMI0Y0fL9FMpVVa7mR5sHKKshW1dF/
	1OiI59mfa0qN6M98XxximmvQkl9h2qcQLxAFiaj5/K58sQCbqg4Wg1NBV1S0NZ28
	ZjG5zkWw0NF/h5c9oJtdmtRJvwJNFFsxLXzpAhxAT3Y+XURPD0Y824WyTu6bAtug
	KpDAWHgZvZV1PaW4m2kQDg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dxvwug01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 22:13:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57BKt2lB009671
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 22:13:31 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsfgddk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 22:13:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mW7NHi2yx/FmZ5BZZsqhqByv66aOwdv/K1KiHCT3SrEJGB6CIYUbmiIp57L71zT8d5wBbMmwSXuEavidHCAcDrMIzex/Jcj+AlADUus+sMLFsETJbOZmsyC0GE1GdOnXO0lMT6XHfQJc0ZD+0YtuNQG0ub9C//iQLUYnIwBOBJXlNKfYqXajalN4O/3fiHo81GcOHpsLHgoO44q3YhbsoeJJJAG805/C040Zr42vPz5KDH4CKkk8/1ZDDl9bgDzpiKpky+bEwUnqtzgREYK9mpwdLbYnfnbY8NuuMckJbE47o7wc9HHzPthw6VmY45m/rpR1z1L2U7D5OXGIMb8png==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iy4EuCfFoQh90pqRhgMr5oWA4ohcL/Gn1LaCwDd0vSQ=;
 b=g9Vp1+zmYHUU+tjgrTh7j2/yIKCI8tFWgW+o53twopzGSi6KQv8WBsQ6epJLG2xd8YqIkPoTjin18dXsV8ACPYuaHNOZqk+Q6kEdrounNbl91Y03RC5+z1I9huIh2Q2lxAHwMXrA8QkZRFIFDB1K4ovCspPgSlmwQmie5BrYItyJ/M7LmLxhNQmzOrAkLmsTsQLMN3aXl9JzlNBpc1V99FvFNhG0vCNu9S6P0KbBak3wI4t7MmHYgmL8jI6aCAc++0y/mLUa4G+/j6fUPZa0FCu99Iz9244lFTcf/LLTHnNDnGHZkfQWiupPAzGHp7EP0AI3cWBcD8tBLSzQLI76hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iy4EuCfFoQh90pqRhgMr5oWA4ohcL/Gn1LaCwDd0vSQ=;
 b=oG/fpTlgSNFpcqw+4G2W6hhk4khbu51iwqOfFNXeHtNA06zAKT8ga2J3fdLDUhSnVvz08IZP4IGFH8/HB1szDSFHkeTg7Mex1LEyNX5bsfm6u8grbXS0zdWpflRka8PSBuesQUbG9BCZHGBIZnrPDWbDaRkxQvuT+g6e5S7uYNU=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA3PR10MB7995.namprd10.prod.outlook.com (2603:10b6:208:50d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 22:13:10 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 22:13:10 +0000
Date: Mon, 11 Aug 2025 18:13:07 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] No uprobes on ARM autiasp instructions
Message-ID: <aJpq8xu03/1BZF4i@oracle.com>
References: <20250610211042.20522-1-eugene.loh@oracle.com>
 <aJouQe8qUJSIPKD7@oracle.com>
 <c60dfe7f-9107-dc90-eed3-1a5afe6fe93a@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c60dfe7f-9107-dc90-eed3-1a5afe6fe93a@oracle.com>
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA3PR10MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cd7c5ee-a30f-4378-37d3-08ddd92441a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?pFnaerG7/uX3LmMxyzZnvItOaT5gmXkn/t7iSICcS/kjpal5K19LwxAums?=
 =?iso-8859-1?Q?lN5kXzxW7djwrft9Ufa9DbIbdYlkUCANDDyyRVFQS1emt0vZ7fQ/kTqPNc?=
 =?iso-8859-1?Q?7aGEqOn4Fyvo7SEackcE0WSYqRRdOBBV6kMvXOad4qHuOU4/kNbSmjaczi?=
 =?iso-8859-1?Q?2RI27c7/lsGZaoUbPlNkUFBP7QVwOeH+w+54XShJiMJ0Iw9RVsVPqu0/11?=
 =?iso-8859-1?Q?q3+0d3QgP+WTINZM63My0RuilcKpDSBHzweU0n477eleh/tC1ZcL2YJSfI?=
 =?iso-8859-1?Q?DOJCURRmwr4aQDCGXGwSyZNM1JkRsjzZr0ppfq6yiN2O/aEFisaBQ0s0Z9?=
 =?iso-8859-1?Q?F5NcNMdFsPwvwMMN7m7MWR8wmx1WhEGDpD7VlZsAmAgpcTOzxxbG1olG5h?=
 =?iso-8859-1?Q?4nzUYIlvrJWGp7pMiKxi5KHgDB3DZqh5psn3TER6uk0aRNp8r0MnwMyU6D?=
 =?iso-8859-1?Q?IEDEJVl+oxSz61VITVqC0tLxmbqFGLZO4rsYWbpg3gZxt95brzkAESxIFC?=
 =?iso-8859-1?Q?quk8uuqt9XF3aR9e1kElwo7Z5eEHElTJJUuPVjantcc9ZoIRWhvPmhDP9L?=
 =?iso-8859-1?Q?eEnZQ/9FYEo6P73SGdzzoRIX69pwMD9ytRw+Ozt8kYKzWAHyhZqJdmNVx/?=
 =?iso-8859-1?Q?oTSKmbgQdKAmZS2zXtAfJ4BqBGnE4MFU02sCNiiLMSzgm2ArwxU0GoKTR8?=
 =?iso-8859-1?Q?BiIGJIFv7lpL1U4kkWJ1XZCerFJAbbcgleW3DDdh6lxO+kij00fD6fmJE2?=
 =?iso-8859-1?Q?ru3iNE44B7o+AybzGqGd/aQazfmK/HKzAzn5CIghGCPsJyCrDtN0OS1b8m?=
 =?iso-8859-1?Q?TfUfteBe/LksG6s5L7Seq7sK9/WK8s1ZUhWJZEiKFCZNHKdEckcSun2Sxp?=
 =?iso-8859-1?Q?AHaGzL7bHyBFcFdnghuhZiqaTDjiLyJL3dd0Ggee/+Aoem83FzpMkHmruc?=
 =?iso-8859-1?Q?CaxDfEW44ugKMwsWPX4FU2q+02E3Wodc373+8+MIzOzNGDomSY7TZZVaNp?=
 =?iso-8859-1?Q?w0IiUOzHO3H+qk8k5A8zerSFP/Qyqa0FO8+ulE2G9aQY9jY0AoSCr4zQG8?=
 =?iso-8859-1?Q?2ghq2kM7AhYUBwHZjf2gnX4EpPDVb3d5rhcvx7Ekh9IHMl+aUQfFLCJYUN?=
 =?iso-8859-1?Q?mURi79eC/37OyFjqJxlgGwXxHlfGluc5EJ4FQ87xx/vPFhSRu3bvQa/nXE?=
 =?iso-8859-1?Q?ee5YsYaGH4BK42TsyAjL5Zq1TTsW9h6vcaxdUAF44VnGOSJORzccg/ok8b?=
 =?iso-8859-1?Q?7a8hiGvXBz9BcO62gNEbpkREjq+8vlISew/uQSia3LZAqjogIkB1hRHG7x?=
 =?iso-8859-1?Q?WpYPwGscwvezUO6PG/UwOJJneGrfgl1wHHUl/FZbtprI5Ue+FQgEdFXp+x?=
 =?iso-8859-1?Q?2M5Pj5w4BVg9byL2vq7qyLn4Sy+uNHIF9B0YRE8Ahsc2bNmeD38hqtBmC4?=
 =?iso-8859-1?Q?aKpANrz6UTC/WjRcgFojzq6YCmGoKqBt6YQMxDCz0mTjtU984mjhQVNry7?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?SXd3C2jO3nEtmmb1Ln5rXrXD2r8lEtpc7/VedZsoL8py8GsiPhz/fb1rJ9?=
 =?iso-8859-1?Q?kif1PP4jjbxoBtN0X4eDQhiG9BKaFh3voN3nnhWNCxBma4sEkDaG+txDLk?=
 =?iso-8859-1?Q?WWImsiIdJEKwqC5NQPpNzbSr2wEIwO9eQBlF+6x0541YoK5RAJOB+GwHQp?=
 =?iso-8859-1?Q?Laloay4wwyQ9HFHHcMbkYipE8RKDzwOKCjRkCZqKV7h8czQXsKewpbkwz5?=
 =?iso-8859-1?Q?vempzU2jKFeCmYVF8wVimss7T9V/UF8dY3OK4JXmr54BL8P5zjx5YojM9s?=
 =?iso-8859-1?Q?+uKzpdzTFeM6TemzQvFhl/MsFrzJm2y++tZlSIzXMS5TLivN2o2UXYCURb?=
 =?iso-8859-1?Q?yO8Dczv9jFj6C/jik93stDKiJvv+iOVH3T3zn0B4Fuph9riuYOsMBWzb8n?=
 =?iso-8859-1?Q?cg3xNFUR2kstuiftzV+9m+Qzb7ho3BbKdqij8BKYssNIKV+jGabC0flrGU?=
 =?iso-8859-1?Q?XrcpimFPvFOLIIgMQ2aaVRTs9zUSXNoz5i5KlPVGDgvp7ef7CMp440/y8a?=
 =?iso-8859-1?Q?G658zHWQRteJwRbM0f3QmJdTKf25dkpUxDs9RD4nIxmaG8SZLsCIdQfGei?=
 =?iso-8859-1?Q?xics0EKyUtPH7pT6OZIt/JvI+cUNxug7Qq5A+HSb9NTuVktnBRX9g3eYYX?=
 =?iso-8859-1?Q?AB5IwzSfcuYllR/hXiD5Lh1Ps2NlQbHaq3OQnOaVG+VAuz1bwt3UJXDGb4?=
 =?iso-8859-1?Q?rTT1GbEtziN6mEvlmWukF8KJUF6Bn/R5UC5t55TjMatyVZ2EQye31ZWP3U?=
 =?iso-8859-1?Q?/kbGt3ymC7h7tWNAiMo3u4V0lFtBDnEMHKYKx2+1mUl+qlzGgLtyomI+dE?=
 =?iso-8859-1?Q?85JxRH5HYlAVDTjkh4gH+kk1WubyPicL32yYGZpV7OlLnYQszizssqV6r8?=
 =?iso-8859-1?Q?xWrQ5IR9POrXXuzPWMCqTE4oE+uTRcxPDQUHnRlKMwzXqZVT33dH4sP2Dn?=
 =?iso-8859-1?Q?5E6llKuJL+WKT63trkok2ESVaBQq1pGc+UsnLWj4enBpgxdI8X+7QRFXRG?=
 =?iso-8859-1?Q?ph/YFQPl8GUcL+ERDJLreV5giIFluFNqkmVnBD4Y0psx3uvCON1vi56TV+?=
 =?iso-8859-1?Q?EyDots+AUMNlxle2xhSzLj8vmaHUjuSAdPQuI4JH2+dpicFXEEHFFeGiWn?=
 =?iso-8859-1?Q?/HpMu9IKEmEqysDVhqAZC/ynGSnjHT+oJUs469swvfquidrzYWXVgZZjqB?=
 =?iso-8859-1?Q?SbrdJ3S21WtitiBb8UQC4nca3l4At0R0fNxBwpYHUclAQhM8Nt3Wqp6W2r?=
 =?iso-8859-1?Q?vva6ym7X6xuUjzszfeo7w4F5QQu58vEQS59i8VRP5I7LQQetS1EoBAmjJ0?=
 =?iso-8859-1?Q?+m+mHF1zdPUWBRm5nibMM3J98vWHVl0yAnE5cizOxaIKVSSNMosKw46M49?=
 =?iso-8859-1?Q?WSnSy5oTfnsQVNJu5dDbK2PSvYBcw+0DiSwGfogqIqN3UUoprMxlM9/hhM?=
 =?iso-8859-1?Q?A277pkGkh5dFqxhtA4NWhMICrzu/XbuPYQUB1wI6BjvT8kDUoscmihqfZ7?=
 =?iso-8859-1?Q?KAi+56sS6YPCiw0qM06qeZRDYdSi9Onm+DsmmdsIdS8LGGdWBL/5kebGTU?=
 =?iso-8859-1?Q?FQ3kkl5rtOyyebhKKxNvQtu0sVr6nWOk+9+P+4wpq+ds9SVQLAmNTBdnhn?=
 =?iso-8859-1?Q?YqRWd7E3cb7oG3y2I0dniLDcj2NPuLZpU6BDbVlb1s2MQRxxvesqxHdg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zSyyDta+BhTEtt/XyZwIqgMhVg0uT2Y5c6BPHJ+bFJzP6i/eIVW4lACNvHIjkfyQIIZtSVRMXuxWCaSr5EjMhhEi1QLJem42OK9IIPEkz0igDB9xpWCfgiA9Q5II6iprLOGJKXLBXZd+s0wZITOve6OSSgypBnue6Yfy6zA1Vvml2U5aq98TSq+tKPCNQPXSx1GtvlYnuD5yoIaLuvB627Z7Kp2mGG54EXVY/ERK87fqtBDWRCG3nRPS6eS8v9MjD4og6EWHoxt3otFHPu1IF4581N7TNKmyTlbe+aW8OWAnSSyVfHCj17kJYSlMQnkJ92XiyW9ElcM7EzhMegkiaM5FCsicBt754ngYcRQO+oW67+f5Jo4tIphp2638NXKnKZ6EGQ0HP43CLVdg1VZ5fdHx9rnqTTft8cu216tkd2kuF3vjaIydZZlJBgb+ZM0VVu1mVQEWdNtBrclfI5UKsfHQScYjf4KX58ZfIh8uuW7fXvb+xWxZke0mPDt+K53V8HXNardRtsP/rvEVXXYPKrh6/l4zIeSgRVF5nFv/P5Ih5Xv0hr8QZsE41iW+64W1JtFd8nuLt0zwVH/XuEtr99Bc9+TwJfz/27rn6NXqF8A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd7c5ee-a30f-4378-37d3-08ddd92441a4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 22:13:10.2499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0+8Z6SCHv5CemEhZzC2LF2L0DJFmSyFwARxaxWMmj8BBiqKoDRv45z14Qq0T7ARfgWhrF65lz/9Ye/QPpq9yssrUiN0EwC9TPlNH1MKJXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7995
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_05,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 adultscore=0 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508110158
X-Proofpoint-GUID: vJbj4mrQhNMy7De9v4kfpB3xLHjdGKD0
X-Proofpoint-ORIG-GUID: vJbj4mrQhNMy7De9v4kfpB3xLHjdGKD0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDE1OCBTYWx0ZWRfX6d3VIm3preyV
 OgxwC0a/Ky3qLJkKp+6p+1Cs/1MZb+viFwvvHuSMBDGMPR4xdjU1X2VRqUH9bw857wrrwsJaiVC
 Uvo6/2gnBMF8kCFtOvNTR7piq8+1dpUank37rRhNTNXgFacxbZjPf18SQ6TvgHMdJN+VEXxrkYf
 1W1J72ejisq4w7A11STQEvJqTQNK3EmXqW97tptRm6JGPNvsGDz5lqZoo0/5Ls4z7Tuz35ax7ty
 Z1oqG51D2Lvqb/HEjUp1DHMs1+O2kApEN5tkeN6BbYAdT2362dQO7eo8O2/gi6Oblh4M1AEtCY9
 HbuhyoiEkDztf+ikePErsyidQrUTOhViPUv8BBjYLTQmo50iBjwK3zNi1zEAgfLkP07onr/GeoS
 qErOVKMmm2EQShuBcxR6YkymwnM+Qnk6Opkloixgdz8bpMxnitbgA4AyN53ixFOn7xI4PXJx
X-Authority-Analysis: v=2.4 cv=dpnbC0g4 c=1 sm=1 tr=0 ts=689a6b0c b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=BHnPqH8-o7ZHQqM-gkQA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:12069

On Mon, Aug 11, 2025 at 04:52:43PM -0400, Eugene Loh wrote:
> On 8/11/25 13:54, Kris Van Hees wrote:
> 
> > On Tue, Jun 10, 2025 at 05:10:42PM -0400, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > New compilers emit autiasp instructions much more liberally.
> > > A test like test/unittest/pid/tst.entry_off0.sh, which tries
> > > to put a probe on each instruction, may fail.
> > > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > ---
> > >   libdtrace/dt_pid.c | 23 +++++++++++++++++------
> > >   1 file changed, 17 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> > > index e2d4e540d..833e9b647 100644
> > > --- a/libdtrace/dt_pid.c
> > > +++ b/libdtrace/dt_pid.c
> > > @@ -279,12 +279,17 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
> > >   		nmatches++;
> > >   	} else if (glob) {
> > > -#if defined(__amd64)
> > >   		/*
> > > -		 * We need to step through the instructions to find their
> > > -		 * offsets.  This is difficult on x86, which has variable
> > > -		 * instruction lengths.  We invoke the disassembler in
> > > -		 * libopcodes.
> > > +		 * We need the instructions for two reasons:
> > > +		 * = On x86, instructions have varying lengths.  So,
> > > +		 *   to step through the instructions, we need to
> > > +		 *   disassemble them to know what they are.
> > > +		 *   We invoke the disassembler in libopcodes.
> > > +		 *   (On ARM, we step through 4 bytes at a time.)
> > > +		 * = On both x86 and arm, we want to skip certain
> > > +		 *   instructions.  So, again, we need to know what they are.
> > > +		 */
> > > +		/*
> > >   		 *
> > >   		 * We look for the Elf pointer.  It is already stored in
> > >   		 * file_elf in file_info_t, but getting it back over here
> > > @@ -298,7 +303,6 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
> > >   		GElf_Shdr shdr;
> > >   		Elf_Data *data;
> > >   		size_t shstrndx, off;
> > > -		disassembler_ftype disasm;
> > >   		/* Set things up. */
> > >   		fd = open(pp->dpp_fname, O_RDONLY);
> > > @@ -344,12 +348,14 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
> > >   		/* Get the instructions. */
> > >   		data = elf_getdata(scn, NULL);
> > > +#if defined(__amd64)
> > >   		/*
> > >   		 * "Disassemble" instructions just to get the offsets.
> > >   		 *
> > >   		 * Unfortunately, libopcodes's disassembler() has a different
> > >   		 * interface in binutils versions before 2.29.
> > >   		 */
> > > +		disassembler_ftype disasm;
> > >   #if defined(HAVE_DIS1) == defined(HAVE_DIS4)
> > >   #error expect disassembler() to have 1 or else 4 arguments
> > >   #endif
> > > @@ -390,6 +396,11 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
> > >   			/* Newer kernels do not allow uprobes on "hlt" instructions. */
> > >   			if ((unsigned int)disasm_info.buffer[off] == 0xf4)
> > >   				continue;
> > > +#else
> > > +			/* On ARM, we cannot place uprobes on "autiasp" instructions. */
> > > +			if (*((unsigned int *)(data->d_buf + (sym.st_value + off - shdr.sh_addr)))
> > > +			    == 0xd50323bf)
> > Are there symbolic names we can use here?  From an include file concerning
> > opcodes or (worst case) define one ourselves.  From the comment, I can assume
> > that the 32-bit hex value you give must be that instruction.  But is it an
> > actual 4-byte instruction without any values taht can be set for different
> > uses, etc?  Perhaps a define and a comment explaining the value might be
> > useful here.
> > 
> > And perhaps do the same for the 'hlt' x86 instruction mentioned above it?
> 
> Quite frankly, I'm not familiar with these instructions, and the situation
> is getting worse.  There is another x86 instruction prefix that causes a
> problem and needs to be added -- some "multi-byte nop 0x66 0x66" thing.
> 
> I'm tempted to go another route.  Instead of building a list of hlt,
> autiasp, etc., just exclude the ones that don't work.  That is, if I ask for
> pid$pid:$mod:$fun:*, silently ignore the offsets that don't work.
> 
> If I remember correctly, a challenge with this approach is that you don't
> know until later that a particular offset will be a problem. Each offset
> would entail an extra runtime check.  That seems unfortunate (and
> unnecessary, if one could know in advance which offsets are okay), but maybe
> it's not such a big deal if you have a lot of probes anyhow.
> 
> Anyhow, I don't know these instruction sets.  It might be nice to have a
> solution that does not require specific knowledge of instruction sets (and
> other info).

Unfortunately, the only source for this information is currently found here
(for arm64):
	arch/arm64/kernel/probes/decode-insn.c function arm_probe_decode_insn

(for x86_64):
	arch/x86/kernel/uprobes.c function arch_uprobe_analyze_insn

So yes, um, good luck.  Interestingly, the arm64 case seems to be easier to
handle than the x86_64 case, yet we do not seem to run into issues on the
x86_64 side as much, probably because the unsupported cases are sufficiently
rare in code.

Trial and error ahead of time is going to be expensive.  But we could see about
adding some flag to a probe program that marks it as "ignore any failures for
enabling any of the matching probes".  Also, it would be worth looking at
whether there is a form of multiprobe support for uprobes in BPF so that we
can get away with a single program being attached to all the probes (saves
memory).  But that again would need to be able to ignore attaching to any
instructions that cannot be supported.  Not sure if you can do that.

> > > +				continue;
> > >   #endif
> > >   			snprintf(offstr, sizeof(offstr), "%lx", off);
> > > -- 
> > > 2.43.5
> > > 
