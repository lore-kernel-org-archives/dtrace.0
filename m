Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987D3394
	for <dtrace@lists.linux.dev>; Sat, 27 Jul 2024 01:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722043894; cv=fail; b=te62uuMzKD76/4OtkV/n5BjeGeRoQIgpGiP+ZPtbx3XqZLPhUR/1YzRzZYm0blcy8Oe4qW5IbyJjIo28muuVuAkxyZSiXe91arYq1iLQWH2oqs32BI+nGIif1DUrp6QWzrGb1MQ7PyyRDiCpjC5jBYdlkXk+VOy/6tEmUJKZ/YU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722043894; c=relaxed/simple;
	bh=G89nqYQdkrehJWsNy25DcCFnuYthLhihQ+KK9L4dM24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kbPEmzrnoPkM8QzGe85fTHuCdY1PXYRP9f2IEETTGla/ie2ciCQWmcCbbfTF9SBKgMQJbtuC7kl8pAn30X0q2nnLprKTrlgZna489K+Zha2BksvRXeEfe+9CMvUg/D2RbyGzU9e11JOwfBy+oS8Yxpb7O9IocNGOZEcAB3Splsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b23G72Gb; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xF9BIex2 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b23G72Gb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xF9BIex2"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46R0uCc4012933
	for <dtrace@lists.linux.dev>; Sat, 27 Jul 2024 01:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=szrResLItet8XmbigcAlqIaQa+/p63aJvZoydo7jfAw=; b=
	b23G72GbL6cyDO5/73k+U8CWEgBySgS5yK1SBu8ut4weUVMbRKcCsFnKoXf6fueS
	tB3p2uySuop3wq0LaU2rqKUgrrGCU7sdgqKt5+N9Bf4gQ4H5Bb+ZXymExJSG/Zcs
	s8bBa3Jn72KycxEi3EjKFYBTNdy2ezcrLOt17XgRiC9P/TwmOPI052eDB8flkv7t
	G9aop2MLV1cRGYJOQRcWfEIEj5DxXlOzvEwW1AQ8qKIPkC3yBpeRED+BDbMs1v2k
	q5aPcJBPQZ+dcTBbi6xftWgyDMKZ/yMouiltOpGpREIjl5M1RkVl/rwiDGj5eP+T
	g2mgpjgeTS1zwDiPhtwOXA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mpsgg0gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 27 Jul 2024 01:31:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46QMeRMF022556
	for <dtrace@lists.linux.dev>; Sat, 27 Jul 2024 01:31:30 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40h27snrmr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 27 Jul 2024 01:31:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uE39helAl8scH+xQ+D5GPjA2sfqC98Jucr7R9X5iqljh2ANsaB+VG0W9nmvF3Q16/CqFyXqW8YRds65kTx4ovPAAkMUBRPKurWYMpvj91MSItWJjLJVyvbV2+OEJsXkhqSICTCYK8sGjCTeHMBtpTzZw3k0AGwpSjcId8Qxde8SmMd1Y5ylhh4fT38Y5OLivfDVskSBNHvoFu3DEsz0WBP2i9lJo58/AWToIaI0Lmr8wQ3SQIFEQI0x27DuZ2mBcCFG1t/41tSl0qu2iOlcoq+0w7kXM6+gmBjPDc1A4zg2PczY33zz7n0K28Og+Hc4axczZsNSzsnimF9VHRaEedg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPaNiG6+wTE1xRWgBVwDbzd2CwdP9ZjdEtWng2wVGDI=;
 b=YX2DATxHthULr4pkdub20av7mdUVpIBPr02EdweKUC3Nfjd3pGhntjqMrzEcTIL86EJG9hnP1LPfwig5QXnh/ESF5T5voD6BgTmtBe4zOI4YwTVpJ1xX6WePSGYYYdk/wj8f79Cij/wkC+Sgy9e/K+DUw6ObHMnnkz6JE7fdxdfih9jJaxEccGFnksFU6ls3K25KU0AtjCQNRSB0H4bfewF5msX52C/fUAu06fXll+aLPPkulVWeiohadWuzATYxYHNVD1GZrPPq4Wq7bhqleQbQpVK4QL0/QGgk6ha1hZD4iMPSVI7EL/QLucXwQJ1cTm7X0vfexDnjIWV83Lg5Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPaNiG6+wTE1xRWgBVwDbzd2CwdP9ZjdEtWng2wVGDI=;
 b=xF9BIex2vDOuyofjjkV0X+y+treURVOMYcsoBO5rFZLq5a5LMGLgu7UNvl5/bCsoUkhH6FaJekVLbJgLAPNwiSBPaZx6zIXad8CaAAdcg/zYHZHbqlQLKca6LpyM4i5kNTfkrgxzEMHeiUYv367tgNklRtmXAlzAF4nAWUD9poc=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CYYPR10MB7566.namprd10.prod.outlook.com (2603:10b6:930:c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Sat, 27 Jul
 2024 01:31:27 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7784.020; Sat, 27 Jul 2024
 01:31:27 +0000
Date: Fri, 26 Jul 2024 21:31:24 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: if /proc/kallmodsyms does not exist, skip tests
 that require it
Message-ID: <ZqRN7HcS2q6lFIpv@oracle.com>
References: <SN7PR10MB62875BE51BC23A19B3D1C343C2B42@SN7PR10MB6287.namprd10.prod.outlook.com>
 <d43aae50-c62d-dbad-081f-0c281f8658ce@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d43aae50-c62d-dbad-081f-0c281f8658ce@oracle.com>
X-ClientProxiedBy: BLAPR03CA0154.namprd03.prod.outlook.com
 (2603:10b6:208:32f::28) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CYYPR10MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: e64e0fef-cee1-46c6-663c-08dcaddbd5bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?xfwU5Q3QxGJjf/s27U1t66BC9bTJKHKtqG/olsU2wJuZH/Y2+gImWnqZdm?=
 =?iso-8859-1?Q?cqZ5X54kYn2HK4YRzA16qw4T4YdmKtZVX+nCurXOYGufErqQbdVlm0hUwf?=
 =?iso-8859-1?Q?Ut3MGg4NpO+YXRDkaTnc6cKj9obzHSnT0Y17lJythfHxVJYuumVw/E6Cxe?=
 =?iso-8859-1?Q?17Z+D7ZQfj/FECzXtFsdTcRtAgJ4Bfq/MGIbD/SHf8ept+T4/RXTueaXc9?=
 =?iso-8859-1?Q?yER490JNwHBf/yeCeeWJbZhwivHw1FTW4TpAXZm4QfHMCUgFOmWHk/vJ0H?=
 =?iso-8859-1?Q?a2WV1c7s9roYnmZdbHOO5QtuERjUqUNcBMTxyq5ETYyNIx51UlwWequT1x?=
 =?iso-8859-1?Q?A7sUPM2YZ0oEVxIaflYjRBUBwQvQcgzyj5MJX8KbExw+7189DOH8YFIwGH?=
 =?iso-8859-1?Q?FqTvFziOYlFO+qPO3M8rM66wrUYylIvygKhAgUlT95rzeu/cVfqVKWZ68w?=
 =?iso-8859-1?Q?FJdA13KKWjXKd1F3/kbyZ+kXG4Ii0uEvZyMjuZVqV3ip+BM2HWSUf5m5HK?=
 =?iso-8859-1?Q?5jlyN2rglER+wvSPNvwHPQuaNrNhZT9zBbJdY52sTdUu7llU2M5nYsnyYg?=
 =?iso-8859-1?Q?hbpXzNIiXZ4Pjc0NlFZ3sEmyzo4tADKzF3HED7jrbc5hZQXMcy/Llz0mNf?=
 =?iso-8859-1?Q?oPcZ3OTPtMGtkmuzTVx6GlMaZiARHIVNKZ/DgmkMql7elKdLjofiPGniYQ?=
 =?iso-8859-1?Q?03+qQOCCFVSnr43BaVW2dOMDnQeXYUBMq7bu5ZSffC1qVXYaj1Ep0G7kHH?=
 =?iso-8859-1?Q?8lokBHYQq2ua6WuOchZ2z519X+lk6HBu9fO6+zGhVcQpblLfvu6MIbAW0P?=
 =?iso-8859-1?Q?bgsS06eRxIVONMcI70jtDj6UgMoS5JSGSLFFr9oprANMyZ7fDcBwtisAcE?=
 =?iso-8859-1?Q?jVlgrOBnnJ4q7JUwQEswj8KdKGnv79t7Gh4GbvCFc/FHw/YCzgY6JYwhxi?=
 =?iso-8859-1?Q?wgF6YTKN6G5f1qU0yRTJwRUqwXZ4sq8xIreQg4lOsSDpPzSBXcVQ+3VpSd?=
 =?iso-8859-1?Q?/pp95WWvE0Twoa5AEwfxYFWdNNPKbCVlFTR33EQ0Rnb6wUXuioIaMjo9Qw?=
 =?iso-8859-1?Q?imeQrz7Vp0c80sEbS52THsQp3MsXuxU7XQKNOCWNfPnGLO/4kfDWAbS+/c?=
 =?iso-8859-1?Q?7K1nDzx7JnVEXuVAL7dGqBwWugPL/15GhgcDKZmwaectVmKkVq3ySJSvio?=
 =?iso-8859-1?Q?SO+A1eTKjC59H+4IR2zQXWnjuBalP1BQIOvh2iXgGLHr/xfAVRUfMsjjg/?=
 =?iso-8859-1?Q?2eDnsfb7QvWb5ZFG10QswwZlzqbYao/bDlGhx41riHE4UlY8N8uVrAu2U/?=
 =?iso-8859-1?Q?14LPtcxOF32p0ruzFucqiWcJdnXR+gz92OJRclT6p9iGMPzsLEdL1UuvdN?=
 =?iso-8859-1?Q?IIWY0M+Gf/Y4dCRRDewj1zbKUe0lFVxChDQmqrBYDe7x14DSRnwNM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?zzzimKzjEUxqDz6hxbnxvDYrYMIYSCTOU11ZJG3RSFTT4XGpEJt7BAOw6W?=
 =?iso-8859-1?Q?XDlSXzWIS4dzy2YRtmp5REyC8/weXUC3Whw7cdkU8DZNwBGFEX2+m0m/1V?=
 =?iso-8859-1?Q?a/DIO7On4Kot1ADXf9dpC3m3n7f5Pn6gFOopmCHGD3ZCDBXabTP0ZvXIbw?=
 =?iso-8859-1?Q?9oJKe6AyjV7JziXeR1XC9NJbucuVT/Ex8V5dmt2ku+Lr6eTKG6hiUEPIru?=
 =?iso-8859-1?Q?Yo+3NiNyJjVy0j8aNF0RWs8sfmhWswBczBfoIsVx4M6eyr2Jiz6vFu5vdW?=
 =?iso-8859-1?Q?Ex21Z4Rf/62XJ2RqvUidJjmajFeBUO7mGAEQFRkqNAQAWFOv6SVyH2lsLk?=
 =?iso-8859-1?Q?iuQIv1l1g9Zoq3rduJdLuKBUpwMHHFyee4zYU5QInAbwwsArzN73F694fW?=
 =?iso-8859-1?Q?upZhkKmhO3icxTc4dD0/5pNpRygGl/x/T2+vPa5bAwlEXYFT9/0Ssm/9mJ?=
 =?iso-8859-1?Q?c3IZ0D/X2cGnih+f9Uzu5fdAZ9HfD56Ix2GwZ11kTE/irinFEmenU0LGe0?=
 =?iso-8859-1?Q?yMwr170ATdweMUbBkBAMT9zdn2GETyRQK5BtUmLUMyVqf9CEGpUzU+TLti?=
 =?iso-8859-1?Q?xGEPZ7J1h6LjzwEZWhrN+rpwpNVQ/JP+c5M8ntIHmpsyYCGmPWbL65qrFE?=
 =?iso-8859-1?Q?2MN3vgCayRwP27S+hSGDUEuApR72w7caUsjNCJ4yvK9/7QPwLbfCbRwPQm?=
 =?iso-8859-1?Q?BjWY7WLteyAt6Vzf34/9tKCjVSuQgzh7mQ9gEBppQFTRE0m5Oxqtl3giEz?=
 =?iso-8859-1?Q?O4X+QbmN1XvF9lltnOzHWkQq23ew85d+pZDWoCKYj/JvfMvTwzVmGsIajv?=
 =?iso-8859-1?Q?3jJGY4OLLj7wFtH7jg97VGx2GF05ckodE0QV+qanBZlrmE6jTZem3QnLTu?=
 =?iso-8859-1?Q?i9D9LYCEutcDjVbShLgRMElei5up8DGz1EkcCdDADU6IbDWooBUDJi5SJZ?=
 =?iso-8859-1?Q?NiWQWHax+n5USMpZwlfSlmp3CU+G4aJIdSHRBqDvgoq+EXBckuwHkXmHJM?=
 =?iso-8859-1?Q?Bf/YgOPEyPEm0CGJi/SdiNdIkmG7KNSGRaSHfpCuXIy5vdPQUMztIiGH04?=
 =?iso-8859-1?Q?pHMeAHJtgnewwANnlelJDnmw0R+RjsstjkIX16OlgMyb4WZZO6/DGTnyqf?=
 =?iso-8859-1?Q?pgxhWToQZ2fGn2zppjDcSLqY2xe74LA1entfya4YHitvZiSkCQ2lnFVcKv?=
 =?iso-8859-1?Q?P27SXOf0vzqn4CU+TBdW/dQc8spDSBc/ZMx2nzRqI3tc7N8tPLJpHQ99iD?=
 =?iso-8859-1?Q?OeJepk0VOPbA485kfuizoLYLDFXLgD9ZPKSi+1+CMkAlc3OLTKV4m+wwI7?=
 =?iso-8859-1?Q?xqDZYHHahm8+aQaOdfUm/KamAR8J8wELu3aX9rj9UxUuIACHdfKkvqFRzl?=
 =?iso-8859-1?Q?SJAKfLMTI6c9aWuPs/MjmA3OSqOZJWsGrN0++uKb2+c/GHLytQ9ys5A9zJ?=
 =?iso-8859-1?Q?YPlHpMNNnzvTcM2jFTo0HJnQidSFzezLyRjTziKsjM8LEBaiE9ugMq6Ody?=
 =?iso-8859-1?Q?dGVkQzLIJd3Y4xEOhygG1bDFtuePRPUYWbIO9WwV2++zG2ZQB9bCTTe9Gu?=
 =?iso-8859-1?Q?RkxQW9+lQAG7GcxDvg4nQFC7wMuOpSXSiEHimaxzauw7APnf/zpG9NSqbb?=
 =?iso-8859-1?Q?/MbCMBkvTWRTJIfzwe9pFN05DjswJG6ZlXsj6HaLlptPMvnK8GTO7v5g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EXhS5ZpA3vvb3vlHlvdWX8e2gZvJ4R7X0FH3OijigrAoqPvdkJIT1FWjst0Ki6J9vKjuss34MPWnlcGdFEmNy/BLl/uTJE1sSE5ZlVSn91tF7F7m2OBDihRyZCMwqmHFCaoMWg02w12BSDQycfujLibqevprNALcaAklVlOyPdDMl4bBC7WXuQFro0tgBQ9AqJ8f6b6HNMKchDNB/1+kTUrkGyiUcTwP+0YHBjGFDMHqWImClJptW4MGVtmwByX2ytQCAqAp+vpqAPTmTVgAn1wcnaKEbnvGUY4LMV4lFLr/xGG2fINGHuJgCp6lvkAcrXZ8d4qGM0v/os0jmO7IYcWcIx6/kEJWqU9RB2bixcd3W98jcDwWRGvwDkphFl2SRC8CKC+lhA4sil4e2DZSTmmSbMGrkLvaLu3v0mk4GcMBA44mFbVPYOudbEM6A2MTyVyxUKvbuVChSiT6fsOO6Tb0lo01CjmX30elJOTdefWKcMIPI8R5NcuueIOo1B0PrCxo5webS7VqFbMITAamJUYdZb5gqKCp1g09sWI6X+oYll4i7LwHmzV+iOTqvEzSf80Ufq/gb3xOSdj1rQSCuJnV4mjtH2eNHu/WJX+tEiE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e64e0fef-cee1-46c6-663c-08dcaddbd5bc
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2024 01:31:27.5912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YPVMy/QAHpPobjj/3Qg8/PeMpUlt4YZbwTWOkfqk4dWz2PktB8YQFk6sA+VgljOz6GC8TbJPuluXVHwUw3/CX8uqNih+eWmYH47v5b3vNnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7566
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_14,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407270009
X-Proofpoint-ORIG-GUID: tS04dPh0trWWQfM4Op97SdKNOBuAqe3e
X-Proofpoint-GUID: tS04dPh0trWWQfM4Op97SdKNOBuAqe3e

On Fri, Jul 26, 2024 at 09:21:37PM -0400, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

Thanks.

> but two comments:
> 
> 1)  There remains a possibility that we think kallmodsyms *should* exist. 
> That is, the missing file is less a reason to skip these tests and more a
> reason to investigate why the file is missing. I'm not sure if we want to
> address that.

If /proc/kallmodsyms is missing then that is a problem on the kernel side,
with older kernels.  It has been replaced with modules.builtin.ranges which
is expected to make its way into the upstream kernel.

> 2)  In both files, the compact fix appears between another check and its
> preceding comment block, which describes it.  How about inserting the fix
> before the comment block, perhaps also adding a comment for the fix (mainly
> to match the commenting practice of these files).

Sure.

> On 7/26/24 19:48, Kris Van Hees wrote:
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   test/unittest/aggs/tst.aggmod_full.x  | 4 +++-
> >   test/unittest/aggs/tst.aggmod_full2.x | 2 ++
> >   2 files changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/test/unittest/aggs/tst.aggmod_full.x b/test/unittest/aggs/tst.aggmod_full.x
> > index 94239b47..955fb52a 100755
> > --- a/test/unittest/aggs/tst.aggmod_full.x
> > +++ b/test/unittest/aggs/tst.aggmod_full.x
> > @@ -1,7 +1,7 @@
> >   #!/bin/bash
> >   #
> >   # Oracle Linux DTrace.
> > -# Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.
> > +# Copyright (c) 2018, 2024, Oracle and/or its affiliates. All rights reserved.
> >   # Licensed under the Universal Permissive License v 1.0 as shown at
> >   # http://oss.oracle.com/licenses/upl.
> > @@ -12,6 +12,8 @@
> >   # often of the form __key.*.  If there are few (2-3), the bug is present
> >   # and this test should not be run.
> > +[[ -r /proc/kallmodsyms ]] || exit 2
> > +
> >   nzero=`awk '/ 0 /; / _end$/ || / __brk_limit$/ {exit(0);}' /proc/kallmodsyms  | wc -l`
> >   if [[ $nzero -lt 20 ]]; then
> > diff --git a/test/unittest/aggs/tst.aggmod_full2.x b/test/unittest/aggs/tst.aggmod_full2.x
> > index 2cc64c94..2e4c5900 100755
> > --- a/test/unittest/aggs/tst.aggmod_full2.x
> > +++ b/test/unittest/aggs/tst.aggmod_full2.x
> > @@ -20,6 +20,8 @@ fi
> >   # often of the form __key.*.  If there are few (2-3), the bug is present
> >   # and this test should not be run.
> > +[[ -r /proc/kallmodsyms ]] || exit 2
> > +
> >   nzero=`awk '/ 0 /; / _end$/ || / __brk_limit$/ {exit(0);}' /proc/kallmodsyms  | wc -l`
> >   if [[ $nzero -lt 20 ]]; then
