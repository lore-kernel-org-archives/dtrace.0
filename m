Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BF52D0C7E
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 05:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752558471; cv=fail; b=Zoz8CFv6X25DNQcCrGGl94dqYyNL8re0lknyAL6Ts3RNfvWM2hMI7EJ/VXFLMOAqV5/6ga0exL7sdDZEFhWOnB3kdVeEcJmz4FWcYYmxJhbk31+5mqnqmUEnmQ0rJJwEVYQmyJxm+QnYsJYTGl/tp7/eCbTx60RNkSQ/1oLwYiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752558471; c=relaxed/simple;
	bh=9bQUJ44Qjxm2mgzMfV2/Fo88xGOtnYmzX7PUGeg9RQM=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=iMWdnMdYUcvm3yQcDId+Si8JMKKxEOMHmUvvHl1/u5Zm/zqH8lEebcIohQo3awktPQl6QF1r/jjZi+mb0S6xS+LH0WU0VDuSIlMfT6Yqh5QS+7beti/fdNsUFznFdItcvRWbCGXD5un91YS6uRh5FH9nZGv1A/wc3JGCSWcv1/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rEwPMnyE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gUux0pRq; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rEwPMnyE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gUux0pRq"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F1Yt6R017019
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 05:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=zif6QlCA+ze5Lh/c6lq+Wtokn68bH0eyQS20n8CvZ/4=; b=
	rEwPMnyEoZd2YEX7FxI/f3TdrTHue6CxlpkXtbyFvLB+r5YO9Y6yy4FEtgRltydI
	4XpNDrzJtXFDE6mku/uWbuqhg8mhmiE57dowHZv5FSd+4QDCTRxu5M8cKzKOiuWD
	pwsiYrF4AIKk4De6gG0gNUwKg3xH/++m9MMeIe9NgWe9zT4yMZR3IK5YMjJIPykz
	0QevZSvK+sVLzV73MO2idV9R2BDXB412xIMHAHds6+rIZh1pnLPqBPp+xD9Z3SmU
	qeGAf1h0moiW72JV91XxVUyvGAYheDMdCzhfkaRMfO2JAPha3HqWAshz/wayv4uA
	5gwH08hIpugQnH9CIiSQrg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk8fwvt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 05:47:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56F47wtu011819
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 05:47:41 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2046.outbound.protection.outlook.com [40.107.102.46])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue59g84x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 05:47:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQMoAWb++CYT+yxZ4H9xQ/x280+6lsbLcxFGW7iVzymEoLFBRDD2snb/WIMKy7glyZ8u68KDteUS8ySTZ/DcpSDRbbc+TWLtTIeMC3Tqxsq6ACxp3Pn4uZ9UCOOlLsFm46ehVHV5beu3x8gj7r1hj1bsQAr1NSq1HZI7zKGvZ4LnTBBHw+fk2j4FL6SoOwMOE9dW+KVqPH3q0PNBdqaEsBjAdjiOQOMZFp4+EKWYqLhLbehOxTgmyyAePy2ecW5QQeNsEA3nG3kd3IV8Acmjv6hpTahLxM8AGX0ODF5WIqs11uUHJvARk1WgxuH2h4/SKAAXjtNaH3hsQJNrYabc4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zif6QlCA+ze5Lh/c6lq+Wtokn68bH0eyQS20n8CvZ/4=;
 b=J7NqcudA8uJ3QGzvpXlDkR1j0PlsJN1VI/MW2Xd8/VuZoPTcvb6mPseAFR5YiSJkKAKDIbkyU2WYGMqZCFKZlogAyQfiYnoUaXTQ6aCLPlXpGZnkTfesqfuRi9VejL2pKZldyeXKs8lvd5k6U+k2nE27i5NkmzY1W/xOSm2FJQkFW6pxSVzud2f+7sbdfyC7wrjWMRLUyU43APbdXFLkEjsBlneRXBM1N2fdvq7VDjoCq1qTurxKGJNIrFh4JF1NRPAfp2CFYvytG/1S2Nz6pcrxSrf9lVpCE1bK75z4+Dte3VDaJ3cR/0oG6rOxUpXOip7cGF270LYXR3ZeMSIH1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zif6QlCA+ze5Lh/c6lq+Wtokn68bH0eyQS20n8CvZ/4=;
 b=gUux0pRqOM8V5wGiG76jW6FnI1IsNSniluPFrCt+ZjT3GlJk1vCdpGLLDOAcBuRV3olqwbjuhJkZL0lWIg8onjv032BzeLHP3UNV/TxVdtuoBS7L+uJz4ya0HWe9CZI4aas0ufhwqRW8LDVFtcLE4QfiXK0l6vThNI918pyDigI=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Tue, 15 Jul
 2025 05:47:38 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Tue, 15 Jul 2025
 05:47:38 +0000
Date: Tue, 15 Jul 2025 01:47:36 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/4] parser, cg: Implement the return() action
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:36e::29) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672B1209A91191478708DBEC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH0PR10MB4679:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ae8eac4-bcd9-44a1-c504-08ddc3631b27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kMirPe+09bQh2AyPa1TUUBzfXMSQVttHcUKWr48mkc+wdqX46+nCiQ8oWuI6?=
 =?us-ascii?Q?QMBVj6XSHiiS/3sqv808RndLtFoPAroCvVbUnS7uXhxQknFULIl7+Za2i8/M?=
 =?us-ascii?Q?JIcaC9Bl0bsK76zV/CRwBFXGTj7bU81tFRTQOD8om2VbH8LSnQARIIjbHt9I?=
 =?us-ascii?Q?tM/D1X8THKN8bfe/0WFL8ewgObYwhvQK3VMy2/nQ9iETMNv/aixcvzh1xYkh?=
 =?us-ascii?Q?SWKtkMGR749EKc44/7CnqoNB/lwi/a1V2kBVZPAI2KVSU06qzKZVadNpWEMt?=
 =?us-ascii?Q?oW/mHf1IcDQO6t59JYNfSSt4fX/UMYHz1bDYH4Ege2N7/3lMc6heGeE2MnfP?=
 =?us-ascii?Q?nDYvJ3/jJJU6drngQ6ob/E+omR1uNdbnEWUEOSQPtOzpjpkKnSrxFnxyvoDu?=
 =?us-ascii?Q?l3bc1oCZNNK1gxx7XHxQjpGJFfSGR5QG+Mc3deb+EfygvkAHsaLo4cXWxnMO?=
 =?us-ascii?Q?H8+MdijpHuCOOgVES8ao5ek1xKiN4Bd0t1d1mfxWiuCMblY0VhUv/7PnDlN/?=
 =?us-ascii?Q?HzqRO8OU4xsETj11Gdbkda6HqocIHgRh+qmhr7FvbSSizaVul6q1qD6hf7VY?=
 =?us-ascii?Q?150+yl5iX8ZjdFBum0gWbZWnaN/1V06dsXo29fA2ME/2+ORjYHN6g0afjIfN?=
 =?us-ascii?Q?Jqb8xvPHM9IzfqVh7mhXatf4VCwb9d68NjJpl0dFg4Zg9NRqLbCt1e3b/2ce?=
 =?us-ascii?Q?Hqp1sPiKmCydY9IH6a/QAsYCf6xqS+ECbV8cyZPEKxEmMLKCX35kjgTAjxD8?=
 =?us-ascii?Q?jumJ5LbY/lIShoPjGTtBdaRC+dtuklvG66SOnSdOucaGChj+R4CBK2/Qp6IK?=
 =?us-ascii?Q?DpY+HzcFzDQEm/fc+CmIgP7H8R7JYmtLOOoYJteIAGKg5kNntAXzr88UnWjd?=
 =?us-ascii?Q?q9i6rFxFqq8upyO+VI/IInZRlSodGjDSoMgb9lnwbL2V4hO/K3lJmYCu7xyx?=
 =?us-ascii?Q?nb0M7mtvg9ovWIgJZadw19CeUJ5TuEkvnJ05xcDeAl0bhHF83SHtLzBYXtOQ?=
 =?us-ascii?Q?h0NIjdkoMr9zPgWfMZh1krTYt73R9k7mqChJuqtzHZLLnoNmWdgwMfw+l1fU?=
 =?us-ascii?Q?XZ+Kh4l2aHLFrPDmcXLWhdRzl/ABS3DzG56l13uX2zZPkRogI9u5g1il0aS4?=
 =?us-ascii?Q?QrHUcNsHb2kaLbl3qTSuOywoPBhYVxXIsB7SVLE1JO1I7SxAZ2Y3YNhNI3XN?=
 =?us-ascii?Q?gitjmCQLzou740nPEFYx2xE6zR2cGVAqAmyx4kgI6E5XrAWivuw8Uw3n3U7g?=
 =?us-ascii?Q?h2rHUYo2K1O9cIIyw+kwZWzpejarGyznkkoUPpULzirtbluUQ/qoQP6mdZWx?=
 =?us-ascii?Q?LfVj8x6Cer8XcaJaIkdQocerje0z+fvhhqCLob/+KtM+G1FdlPt2i/sprAza?=
 =?us-ascii?Q?KUx8/0Hm38uESG7hyo0jcLwjLspm5QhoZPw8mVZUWzSle6Nl4bd9Yf71P7GO?=
 =?us-ascii?Q?U6OZg3mYxqY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?npecDcrtvAPkHBE5odTG37BpI+1tGskNcM+3QrHpLTAFv4d7MSTyyBdGOTzW?=
 =?us-ascii?Q?752SRAZ/1/8+Q5+Nod/s4Feqm3XiXppt79050ungwaZlI1pCkRJ/VtC/f1DO?=
 =?us-ascii?Q?xNQ6DwVieoEndAo63hfSFzralh4ylXuRRbJmCzpyi6i8ybYJrpIwJItMU1Aw?=
 =?us-ascii?Q?Ew8Rgjc1Ga7a+TFRhipU1Hnh36jQMn8HfnqOYd5iQqb+6vU/8gCPc4kVXCOn?=
 =?us-ascii?Q?JtheLrtapU9DIhNABHkF0en6K0sCqjy31HO2hnG/ZgKlBAsk9rhPV2vfahql?=
 =?us-ascii?Q?GC/xm8lcFOKn8+mAwTdD0uE34mN6Q+Wt3YpBzsFxwr82z+CPEake0sjlwY7W?=
 =?us-ascii?Q?ww2R67k9VT4ROOn+StKaWKENIvFXAjXvkYI7cvTD8bzUVe1UAJLfs4fO2Rjn?=
 =?us-ascii?Q?B5s/v/P2B0njKdRzRjN+WvQgWSsWcLyffFlOM3ndBYSyGXDehQVVl69mSi4Z?=
 =?us-ascii?Q?IqiiRrHspSF5UzfyYBIRhDAfK+poD8Aj+FQb4scIvCgNbwekKHFg4znbvvGj?=
 =?us-ascii?Q?ABBhD6Fa1gRcNqdfZEcxpcWQDBFMxDYuDsmCFgLhGSGXYFecbWiYCU4q6bs9?=
 =?us-ascii?Q?ShA5apimU9eFwpI5nxYupZ41a37NKbMOrNTcrotS97nF9FUswgfeeWY6UAvK?=
 =?us-ascii?Q?wfHIt+5Bgo93Csj5eOy0k8xmltBXwFoQtFkklldgeNy2ayuGZQ5Lf05I4gRK?=
 =?us-ascii?Q?TM6IhfkvyTcWNmi4jA7DRumU3EmsfA1SPAJ1Ao+m2XZlElyjnyB2gxTgTq29?=
 =?us-ascii?Q?G7iGs26QzzJgwRGIGVOKBTOp87tfXFv8XXi/4a/fZWdDj68ZXZpK0TONNAhZ?=
 =?us-ascii?Q?QCPE/u6X8/Eld3qTnFSPn0TjnGxAjlMbnQDDz7DDdlXVdIXHTeD5kWpc3wmh?=
 =?us-ascii?Q?HTw8M9OIjeQzETj0ozwve+LRwCAdo6UlKndxUffAU0vF+vnGHonx3dw7b0nh?=
 =?us-ascii?Q?PAHa8TG0H/DbNHYtvA9RCbAngk+9oJ/ssRQwMdcrR/nPVFM6J78AP9FdhUad?=
 =?us-ascii?Q?pt96m3B/D8mbKcH3j3ZhpdZlXHAoJAy4HCJjLPOHccVYTQicJxWDPHs/BGqT?=
 =?us-ascii?Q?shQAhdoRSXPNd79g+0N1Knn8BF2ierhJDahUengpPEwPKcoxHbIsm1xGijJr?=
 =?us-ascii?Q?RNTNfF5cudYAf5bhBHRCrbDQWnl7IIAItLBUPjaAScjaUvmI7xjaCjYbZ+gD?=
 =?us-ascii?Q?IELDL+Bg24A0CqELxpQx0IzdXpZhMlafc+9kbU0aifBxN0CBHY6lQzyhCB6l?=
 =?us-ascii?Q?ELvPqwk9HnY4Qxh8mzv0w5xtTXYd8nMGsGyWf+pMjsV2AszcB7Kv824HxcAU?=
 =?us-ascii?Q?Dj16pJiVzxVnlHsB2wWjW8L77kwF7F5XdaLV+AMblwe0aPp3H0gApiR9KP6c?=
 =?us-ascii?Q?eConPAVK7Ez9IelvPXdAoPawrkfdQaVxoiVv/UCEBCELLG/U1CzW5198NfH6?=
 =?us-ascii?Q?B39/2vmkv2fzwpY6PLL1d3gzWv9l6tZkfSF5HZGAfnj2c5bedEjScSkLpZbt?=
 =?us-ascii?Q?CAllFgDdvFoYv+OYF+2+xxtIT09aEI3g1Hz0OyPK9E+0IMKIf+93HsczdTa3?=
 =?us-ascii?Q?97pzeFLqAtRP7D2rVwtPyGCBaYd9nMRI6cPG0tbvFN9bB6uwtzDdYqk6QJ/G?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hyApJ9wQbPHYSjaJn7oYZyR6iZRovmqtghh3PYy1hpLHVlTH+jJmqCeAFAO5ar9hsOkPty7mluYgnLUQqoYSi9SdKXYnYShbcu3+6XuG4hii7X+xEiPuOhBISgfD7b5g9qm6sQzBizLRXz11fbalDhuThgLQTXj1DMyam2YRkR0+v1j0tFlYFWFs4E/r4IQx12v8P69/IJsIHi/Po+TGfX7ssv5jzUubn9kkVKoThrX95T3pbe98INd8yEhka5jQVyKMzkOavq09XkdXWryo82iF0V4hsyaTIu9L0plMe85ijY+I7ChKM99f+pSTKM+PCK55dsU7PevzxK+vtPNmLoaoIgycfBxVKEvy8nzwZegF4fJx3e3DhaZYnm8JcAe6a9+YVG3kiP2YaI+o1jzFLBtrLeJYaHo7f8qFeVrNbIEuf2/M2y3fdK4c0Gc0C0uL3MHevx2sym3W6XLKOmsgeaX2pP2UYWe4hVJXblkcnHp2H5NxejkSARRRJjBqHCVWWMxfaSd/3EvcXl0Gd6IL+sbXBDBQKwHEtZLON9+KwGRpBvfjXu+jjywmePEaE2KFuklYoCffl+TPL9S7zblcP0wsMHHMcT1dV57pZt0lX4o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae8eac4-bcd9-44a1-c504-08ddc3631b27
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 05:47:38.2793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5T2Y/3O5miyPssxlrLi2vWs67TVmJMwHzHnsnB2QomxqoTJfkdda1o9B56BN4HWALz4ripc/DiEqOd8mnciP+Uj51PJ9Ii6U8jbY0g5VtCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4679
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150050
X-Proofpoint-ORIG-GUID: 9X-Hcg1W0yrdHZRN6xiKn1MkeL7KBHeu
X-Authority-Analysis: v=2.4 cv=Of+YDgTY c=1 sm=1 tr=0 ts=6875eb7e b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=USLeBbC3X52KZz9JoVgA:9 cc=ntf awl=host:12062
X-Proofpoint-GUID: 9X-Hcg1W0yrdHZRN6xiKn1MkeL7KBHeu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA1MSBTYWx0ZWRfXyDFpYUlxVlQM EUrho9og3QSew1xUtT1VLtOn9BCcWNhizHDetGw/Qu6YLKd6+cQE5VagTBe9IULtKM1nOTL3xBU 1H7bIYVFI+9hnqpogkY4wb7BKynnX+/gG5rbSOPmtdpCpZWCrVoh1ONWpmrGLrNlz4JmwH6ogdd
 cXtuFNnjGbBpmJ8+SG94gUildxkOyrUt+drjHeYLoTMQ+cNKw67VnstMsqIuJJpVx4l9j3YwJWb Opvleb/xBvamL/Hw/wBklUo+P3vQlfbryVz0WgmxACO3r5iYlFCcb/cS6VDeYpoDDPFa9pq1WCV BDP/2fXAHf1teog2LjjK++NRszNADjbYiTWn+WEg49J9ZGo/L547ZwVkgMCjVoU/yQh8yyx2hWz
 DbI8PHi+BHosn7Smf2Dqk9EABymwyjiEYyijh5vgr4VqPWpBT7maJKO8sdN2UJPjvzE6Dtqc

The return(n) action can be used for error injection by forcing a
given return value for a kernel function.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 include/dtrace/actions_defines.h              |  1 +
 libdtrace/dt_cg.c                             | 21 +++++++++++++++
 libdtrace/dt_grammar.y                        |  1 -
 libdtrace/dt_impl.h                           |  3 ++-
 libdtrace/dt_lex.l                            |  1 -
 libdtrace/dt_open.c                           |  2 ++
 test/modules                                  |  1 +
 .../actions/return/err.D_PROTO_ARG.str.d      | 19 +++++++++++++
 .../actions/return/err.D_PROTO_ARG.str.r      |  4 +++
 .../actions/return/err.D_PROTO_ARG.void.d     | 19 +++++++++++++
 .../actions/return/err.D_PROTO_ARG.void.r     |  4 +++
 .../return/err.D_PROTO_LEN.missing_arg.d      | 20 ++++++++++++++
 .../return/err.D_PROTO_LEN.missing_arg.r      |  2 ++
 .../return/err.D_PROTO_LEN.too_many_args.d    | 20 ++++++++++++++
 .../return/err.D_PROTO_LEN.too_many_args.r    |  2 ++
 .../unittest/actions/return/err.destructive.d | 26 ++++++++++++++++++
 .../unittest/actions/return/err.destructive.r |  2 ++
 .../unittest/actions/return/tst.destructive.d | 27 +++++++++++++++++++
 .../unittest/actions/return/tst.destructive.r |  1 +
 19 files changed, 173 insertions(+), 3 deletions(-)
 create mode 100644 test/unittest/actions/return/err.D_PROTO_ARG.str.d
 create mode 100644 test/unittest/actions/return/err.D_PROTO_ARG.str.r
 create mode 100644 test/unittest/actions/return/err.D_PROTO_ARG.void.d
 create mode 100644 test/unittest/actions/return/err.D_PROTO_ARG.void.r
 create mode 100644 test/unittest/actions/return/err.D_PROTO_LEN.missing_arg.d
 create mode 100644 test/unittest/actions/return/err.D_PROTO_LEN.missing_arg.r
 create mode 100644 test/unittest/actions/return/err.D_PROTO_LEN.too_many_args.d
 create mode 100644 test/unittest/actions/return/err.D_PROTO_LEN.too_many_args.r
 create mode 100644 test/unittest/actions/return/err.destructive.d
 create mode 100644 test/unittest/actions/return/err.destructive.r
 create mode 100644 test/unittest/actions/return/tst.destructive.d
 create mode 100644 test/unittest/actions/return/tst.destructive.r

diff --git a/include/dtrace/actions_defines.h b/include/dtrace/actions_defines.h
index 4ff4fb83..601328b8 100644
--- a/include/dtrace/actions_defines.h
+++ b/include/dtrace/actions_defines.h
@@ -51,6 +51,7 @@
 #define DTRACEACT_RAISE			(DTRACEACT_PROC_DESTRUCTIVE + 2)
 #define DTRACEACT_SYSTEM		(DTRACEACT_PROC_DESTRUCTIVE + 3)
 #define DTRACEACT_FREOPEN		(DTRACEACT_PROC_DESTRUCTIVE + 4)
+#define DTRACEACT_RETURN		(DTRACEACT_PROC_DESTRUCTIVE + 5)
 
 #define DTRACEACT_PROC_CONTROL		0x0300
 
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index bd0763d6..d80b0a55 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -2893,6 +2893,25 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
 	dt_regset_free(drp, BPF_REG_0);
 }
 
+static void
+dt_cg_act_return(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
+{
+	dt_irlist_t	*dlp = &pcb->pcb_ir;
+	dt_regset_t	*drp = pcb->pcb_regs;
+
+	dt_cg_node(dnp->dn_args, &pcb->pcb_ir, pcb->pcb_regs);
+
+	if (dt_regset_xalloc_args(drp) == -1)
+		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_FP, DT_STK_DCTX));
+	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_1, DCTX_CTX));
+	emit(dlp, BPF_MOV_REG(BPF_REG_2, dnp->dn_args->dn_reg));
+	dt_regset_xalloc(drp, BPF_REG_0);
+	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_override_return));
+	dt_regset_free_args(drp);
+	dt_regset_free(drp, BPF_REG_0);
+}
+
 typedef void dt_cg_action_f(dt_pcb_t *, dt_node_t *, dtrace_actkind_t);
 
 typedef struct dt_cg_actdesc {
@@ -2951,6 +2970,8 @@ static const dt_cg_actdesc_t _dt_cg_actions[DT_ACT_MAX] = {
 	[DT_ACT_IDX(DT_ACT_SETOPT)]		= { &dt_cg_act_setopt, },
 	[DT_ACT_IDX(DT_ACT_PCAP)]		= { &dt_cg_act_pcap, },
 	[DT_ACT_IDX(DT_ACT_PRINT)]		= { &dt_cg_act_print, },
+	[DT_ACT_IDX(DT_ACT_RETURN)]		= { &dt_cg_act_return,
+						    DTRACEACT_RETURN },
 };
 
 dt_irnode_t *
diff --git a/libdtrace/dt_grammar.y b/libdtrace/dt_grammar.y
index 048a974d..a0911097 100644
--- a/libdtrace/dt_grammar.y
+++ b/libdtrace/dt_grammar.y
@@ -73,7 +73,6 @@ int yylex (void);
 %token	DT_KEY_PROVIDER
 %token	DT_KEY_REGISTER
 %token	DT_KEY_RESTRICT
-%token	DT_KEY_RETURN
 %token	DT_KEY_SELF
 %token	DT_KEY_SHORT
 %token	DT_KEY_SIGNED
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 2adc1252..e7192290 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -550,8 +550,9 @@ struct dtrace_hdl {
 #define	DT_ACT_SETOPT		DT_ACT(28)	/* setopt() action */
 #define	DT_ACT_PCAP		DT_ACT(29)	/* pcap() action */
 #define	DT_ACT_PRINT		DT_ACT(30)	/* print() action */
+#define	DT_ACT_RETURN		DT_ACT(31)	/* return() action */
 
-#define DT_ACT_MAX		31
+#define DT_ACT_MAX		32
 
 /*
  * Sentinel to tell freopen() to restore the saved stdout.  This must not
diff --git a/libdtrace/dt_lex.l b/libdtrace/dt_lex.l
index cc165c1e..bdcca415 100644
--- a/libdtrace/dt_lex.l
+++ b/libdtrace/dt_lex.l
@@ -104,7 +104,6 @@ if (yypcb->pcb_token != 0) {
 <S0>provider	return DT_KEY_PROVIDER;
 <S0>register	return DT_KEY_REGISTER;
 <S0>restrict	return DT_KEY_RESTRICT;
-<S0>return	return DT_KEY_RETURN;
 <S0>self	return DT_KEY_SELF;
 <S0>short	return DT_KEY_SHORT;
 <S0>signed	return DT_KEY_SIGNED;
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index c67455e7..08394a11 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -269,6 +269,8 @@ static const dt_ident_t _dtrace_globals[] = {
 	&dt_idops_func, "void(int)" },
 { "rand", DT_IDENT_FUNC, 0, DIF_SUBR_RAND, DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_func, "int()" },
+{ "return", DT_IDENT_ACTFUNC, 0, DT_ACT_RETURN, DT_ATTR_STABCMN, DT_VERS_2_0,
+	&dt_idops_func, "void(int)" },
 { "rindex", DT_IDENT_FUNC, 0, DIF_SUBR_RINDEX, DT_ATTR_STABCMN, DT_VERS_1_1,
 	&dt_idops_func, "int(const char *, const char *, [int])" },
 { "rw_iswriter", DT_IDENT_FUNC, 0, DIF_SUBR_RW_ISWRITER,
diff --git a/test/modules b/test/modules
index 0f01d6e0..7782540c 100644
--- a/test/modules
+++ b/test/modules
@@ -1,3 +1,4 @@
+btrfs
 ext4
 isofs
 nfs
diff --git a/test/unittest/actions/return/err.D_PROTO_ARG.str.d b/test/unittest/actions/return/err.D_PROTO_ARG.str.d
new file mode 100644
index 00000000..d04836f3
--- /dev/null
+++ b/test/unittest/actions/return/err.D_PROTO_ARG.str.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The return() action cannot be passed a string argument.
+ *
+ * SECTION: Actions and Subroutines/return()
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	return("");
+}
diff --git a/test/unittest/actions/return/err.D_PROTO_ARG.str.r b/test/unittest/actions/return/err.D_PROTO_ARG.str.r
new file mode 100644
index 00000000..46ca1828
--- /dev/null
+++ b/test/unittest/actions/return/err.D_PROTO_ARG.str.r
@@ -0,0 +1,4 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/actions/return/err.D_PROTO_ARG.str.d: [D_PROTO_ARG] line 18: return( ) argument #1 is incompatible with prototype:
+	prototype: int
+	 argument: string
diff --git a/test/unittest/actions/return/err.D_PROTO_ARG.void.d b/test/unittest/actions/return/err.D_PROTO_ARG.void.d
new file mode 100644
index 00000000..dc3b15fa
--- /dev/null
+++ b/test/unittest/actions/return/err.D_PROTO_ARG.void.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The return() action cannot be passed a void argument.
+ *
+ * SECTION: Actions and Subroutines/return()
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	return(return(0));
+}
diff --git a/test/unittest/actions/return/err.D_PROTO_ARG.void.r b/test/unittest/actions/return/err.D_PROTO_ARG.void.r
new file mode 100644
index 00000000..1573c557
--- /dev/null
+++ b/test/unittest/actions/return/err.D_PROTO_ARG.void.r
@@ -0,0 +1,4 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/actions/return/err.D_PROTO_ARG.void.d: [D_PROTO_ARG] line 18: return( ) argument #1 is incompatible with prototype:
+	prototype: int
+	 argument: void
diff --git a/test/unittest/actions/return/err.D_PROTO_LEN.missing_arg.d b/test/unittest/actions/return/err.D_PROTO_LEN.missing_arg.d
new file mode 100644
index 00000000..97ed0762
--- /dev/null
+++ b/test/unittest/actions/return/err.D_PROTO_LEN.missing_arg.d
@@ -0,0 +1,20 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The return() action takes exactly one argument.
+ *
+ * SECTION: Actions and Subroutines/return()
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	return();
+	exit(0);
+}
diff --git a/test/unittest/actions/return/err.D_PROTO_LEN.missing_arg.r b/test/unittest/actions/return/err.D_PROTO_LEN.missing_arg.r
new file mode 100644
index 00000000..fd7c2512
--- /dev/null
+++ b/test/unittest/actions/return/err.D_PROTO_LEN.missing_arg.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/actions/return/err.D_PROTO_LEN.missing_arg.d: [D_PROTO_LEN] line 18: return( ) prototype mismatch: 0 args passed, 1 expected
diff --git a/test/unittest/actions/return/err.D_PROTO_LEN.too_many_args.d b/test/unittest/actions/return/err.D_PROTO_LEN.too_many_args.d
new file mode 100644
index 00000000..0776192b
--- /dev/null
+++ b/test/unittest/actions/return/err.D_PROTO_LEN.too_many_args.d
@@ -0,0 +1,20 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The return() action takes exactly one argument.
+ *
+ * SECTION: Actions and Subroutines/return()
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	return(1, 2);
+	exit(0);
+}
diff --git a/test/unittest/actions/return/err.D_PROTO_LEN.too_many_args.r b/test/unittest/actions/return/err.D_PROTO_LEN.too_many_args.r
new file mode 100644
index 00000000..37ff4d9d
--- /dev/null
+++ b/test/unittest/actions/return/err.D_PROTO_LEN.too_many_args.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/actions/return/err.D_PROTO_LEN.too_many_args.d: [D_PROTO_LEN] line 18: return( ) prototype mismatch: 2 args passed, 1 expected
diff --git a/test/unittest/actions/return/err.destructive.d b/test/unittest/actions/return/err.destructive.d
new file mode 100644
index 00000000..4c4a246a
--- /dev/null
+++ b/test/unittest/actions/return/err.destructive.d
@@ -0,0 +1,26 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: return() is allowed when destructive execution is allowed
+ *
+ * SECTION: Actions and Subroutines/return()
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	ok = 0;
+	exit(0);
+}
+
+rawfbt:btrfs:open_ctree:entry
+/ok/
+{
+	return(0);
+}
diff --git a/test/unittest/actions/return/err.destructive.r b/test/unittest/actions/return/err.destructive.r
new file mode 100644
index 00000000..004c30a9
--- /dev/null
+++ b/test/unittest/actions/return/err.destructive.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: could not enable tracing: Destructive actions not allowed
diff --git a/test/unittest/actions/return/tst.destructive.d b/test/unittest/actions/return/tst.destructive.d
new file mode 100644
index 00000000..f1d9e4d3
--- /dev/null
+++ b/test/unittest/actions/return/tst.destructive.d
@@ -0,0 +1,27 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: return() is allowed when destructive execution is allowed
+ *
+ * SECTION: Actions and Subroutines/return()
+ */
+
+#pragma D option quiet
+#pragma D option destructive
+
+BEGIN
+{
+	ok = 0;
+	exit(0);
+}
+
+rawfbt:btrfs:open_ctree:entry
+/ok/
+{
+	return(0);
+}
diff --git a/test/unittest/actions/return/tst.destructive.r b/test/unittest/actions/return/tst.destructive.r
new file mode 100644
index 00000000..8b137891
--- /dev/null
+++ b/test/unittest/actions/return/tst.destructive.r
@@ -0,0 +1 @@
+
-- 
2.43.5

