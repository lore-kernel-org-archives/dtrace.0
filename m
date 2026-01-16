Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138D823909F
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 20:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768595902; cv=fail; b=U6CpS2J8ZiKwUO5owtsYQJEfia3H6SLgZJ9Sv18HRVK0AwcjzSAGOzaOD36MYpEhxOW7y95fHcXehr6eKtoRxWLV61rwB11OUSr1FpTkj1xBwWrYYbbiUwp/1S/AcXhX1/p6AV4G96agh7qvHtOvmX+0f7UnqAmjj/maIvT+l48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768595902; c=relaxed/simple;
	bh=L9i5WmT87/oT6A18++LtIDmnOOfrZKZFSPIWIJmJ10Y=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=naxCADmK8Zr3kBQbm2Rv2So41ANGdH95hjI6/eozA3el2Oz2kQldwqiQEAqzEC0AhgE6tKb2SjWQzGWS8EgC1Qa/ucLIq5U9k4DPXbayDGXSjaU5OXXdlsxZhGES2Qwz8VrZaevoANnbN3iR/uADaWDOv1vXYAV4Qx83pPn/3l0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=W5q+gjqt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Vu56G2zU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="W5q+gjqt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Vu56G2zU"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKbOPG4013346
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 20:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=JFq8wyeyoD5YhctcaNuNYqaowioO+oGTjE0vCaacfcI=; b=
	W5q+gjqtZFySo1pkCwYUjaIWypbzUaJjy2LTl10+ZYwR2BVN5F76xudH0cx28CBw
	UHRbq9ibKqkRDNI2cZVKa+SOJeelF/WCF6TCjSZpmYMekjd8k6JIJyZHbdO+X+a8
	2Z2slIeqNvJL142FCQK3dC6ezxljFXZAd1BV1Ftl7rtPGj+fnKb2IrYENi4bXsjS
	CCJaTnDMv0EfdzrqwxCXyGJsHZGxGD0sYLF67XfE4URjXERhvR1m/KA8r3cLh8M2
	k5t9MD+8W5Co9vO6RUrLomR2hnD4jb/hVV1O265RyJnS5lTQFVK6ermt2m2v4q0v
	hPCQe7myXdA5XUO4dnr49Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bqvhe8024-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 20:38:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GKKiBk010780
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 20:38:19 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010045.outbound.protection.outlook.com [40.93.198.45])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bqv9m0g16-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 20:38:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k34bFXPE6vXBud2hrNVk+wF/RgHREUZxZj9xLh92XTkY9F7XvgQgJKwNDkqu826wsJXvGXF6hewh7DyED1vaYCpU+FRy1BWtfscpn+VWnSH76P98oKMEgp8sAAlcTPFU+OyNkcbOlkkhRST2zTSSuVJ72zXW48jI80fbUaVcGqsaPo3MUCMbT5cmgwkbMbjB0/D0CWw7qT9QqmHV+DZxBaBIr3WGlBtA+mDDGVbhZHtqBVkQk/yNjSKfCuvOWfAtrNjRh1QoGH8DcLMMHRF1wobjZzA3+YahQL/RNrXzk7P+se1CjTbpC3XgqzDGNivYF0q9f3LcCaBB4zSAVRxQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFq8wyeyoD5YhctcaNuNYqaowioO+oGTjE0vCaacfcI=;
 b=WnF8lBNm2f7iizEdTrjROp0wv5YGW2RYSkXE/Cj/hmJF1VE1TR6bpcCgkTkPYYAh3slwNzZhTVaEB38xQPOdjRSwFNb4+G2KQNrtbf1bP9L94t6niDPByGkOqrKhzNIYCDwt7l+IlEQxDmflo0WTZD0Wi6PhU+Se/CV0gzyyP+m7q9HZ7J2q65HrsGCpKh4qZX/C5oY4z5OyJGJAJ7P5P7SpYQgHWSoCm7hxgRS26jcs1ILe0ZoFsUaDILSV6jjB74uxmr4uFn7P2POBRTw+8Ps9BiuPAedrl5rJeekN7qaaEZgTuqKIIpVyePusUZI6ukwDlC8d6IUgywIa92AfGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFq8wyeyoD5YhctcaNuNYqaowioO+oGTjE0vCaacfcI=;
 b=Vu56G2zUb14dbSAwaSh5UWr/fF78KNj2ZnDslviNx9MssRiYY32j0CViN+0o7P3y8JDQ0LxRDRN1lO17mHc1fF4Y2tUD1FkiZKiH2c1GhqCjWmV6GgK982iXiIbpIX1NsXENVjLpRCMhVXWCeaJzQIl62KlBAq5Mh+LXXGOGg8w=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6335.namprd10.prod.outlook.com (2603:10b6:510:1b2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Fri, 16 Jan
 2026 20:38:14 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 20:38:14 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] Guard against inserting the same provider twice
Date: Fri, 16 Jan 2026 15:38:12 -0500
Message-Id: <20260116203812.21552-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0065.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: faa7573e-7ba5-4ec8-5e42-08de553f2bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eIiSw+fLCYwWDBamjeIMXydbff/dP9mfpJ0Z6PnQExOMW/s7F00KwG4/THwW?=
 =?us-ascii?Q?PS4LqyLy2S8vdHUycXGcrulQN7DOLBQgy4EX1EE/WeyttbrKEFAZr6AFREtA?=
 =?us-ascii?Q?mxHoPKXSy/zNKrk5SLnIiYvrntDH9kseTNTj0VojuK9uY3tHRn/+DP9UFVL8?=
 =?us-ascii?Q?fzLLhyKYnhuF1IQO0k/HmqdUBKO+wIYNnOlIbMkbPJjuhCMnrVkFWDnpeTVJ?=
 =?us-ascii?Q?nXhgcsClwCq4KsBis3Wr/7YWOOG2TDI30j9CJAtYF8E4yPbV1kDYuxOYg9Xq?=
 =?us-ascii?Q?c0fVt1PCsjn/9seDT2GVrykoSmAOfZOPNNBWGt1jAfd9dJai666gP7KBAHqg?=
 =?us-ascii?Q?wm/JuxSJpdDQCUdONzC4d/jMnjfwqWhxD+2GWL3mb0JQn+KJs1WH8QERCdkj?=
 =?us-ascii?Q?1ksNc7lcKXjMuJMpz2sUIcWivs626l45QgGOB2sF9TO2s7jgyybWYAlmUHtb?=
 =?us-ascii?Q?TkXT5mzS+YpwxAao4SeC40ZOJb/emOSH3v8MSFksP1klT6t+EN4QS0xXOp4T?=
 =?us-ascii?Q?7xiXTDvK3rVhxVJj7y8SqZvdTjvq2ZT8wq/J84j/UXipANfyRLcPAHiMqaX7?=
 =?us-ascii?Q?OMyd7TxyKc+8gue4ihqgHfbPRv28F+/j5tProtEhwkjMceZAqk6N+hjK0k6u?=
 =?us-ascii?Q?dodumGj/wHU95m6y3GS6Vl+jM42Sxu6BRy92e6VX8wI1rmKWKyWMJMLPnEQb?=
 =?us-ascii?Q?lSxr1LvT7wWACbxC4+sxY/EtM9IgBzL8AgTj0bRdbC18WyIicgtRxUQA3fLj?=
 =?us-ascii?Q?DhTlpD9EEbBeZMchmiyhaoTVMBM0zAXf5aVONlsMa1+kZG8zd0KiC3YqOw13?=
 =?us-ascii?Q?ISr6HKtP9XbvL5/4K/5rhVXwnlE4Gfg9SYE1quZAXF+TRLvYafxRfB3klMsw?=
 =?us-ascii?Q?Pdxp4Hu9woXWPGrj3oGjKqx+/JE4PnZpY0BOxdySoXwfEACMHjG2IjxGmw63?=
 =?us-ascii?Q?T0qwdtJgX6XE20/tlolMI4aAFeJsc81wyft7ax+CRf4R8mKHo525C8UhJDuJ?=
 =?us-ascii?Q?cfVN+sjhC7eJpI1pvEpkoV4c6tB8cSWv8No664uQTbcEDcshCwsRlq1xPMq7?=
 =?us-ascii?Q?SAKvuOhX76qoA9/yXXpYwpfgjQeX9n+9/+qD1JuigXcDhs1Hs2IHzAyzWNZb?=
 =?us-ascii?Q?YuMI+0Lu74klPmwT5krPP0yyxhL10WuwxWtPH3Dg+gbvVfM4femN5czlyfXb?=
 =?us-ascii?Q?lGIhGGeGpV5LuA9dCrriMnIvHOIEoKYZ90xnFOug7Ub300bEh8gsMYNHgpO4?=
 =?us-ascii?Q?AM3b/s2B/q9aJvMnKpDMJtvjRnf4RNGeOfSbj98I8LWYM4SUFNSoOCOnGwir?=
 =?us-ascii?Q?9LI/T2FIapLVDQli42XyWxSJRXU8e2xAtvbm0qYZshU7ACL/4ma5/8J/mPmm?=
 =?us-ascii?Q?9wkP0yypyyQRwTtku5zvyLh4+l4mU0BrM/q7Q2hsMig0Zwjkqk03r4VwPCu8?=
 =?us-ascii?Q?lB5zIubQ6Eh8Z2XXFRoYAaaYfttOPB6T+z56GpV6Rxh3MXUgc947iEgUixKi?=
 =?us-ascii?Q?7NCBP/4w8JZ8BowcoQTFtOBjp3ikZRC1QXcYcyXAZL4CXf2x0tjEAGEoExsz?=
 =?us-ascii?Q?B6HhlzIHiNeDTqM6Jrs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?idEmd7RSB/uK8gQbwEqvpBMAlZGnDTG8ts0tC7rkLtSPuchV7usY7Fii6KH6?=
 =?us-ascii?Q?02Cv0t3AsL1GQ00OswskbiK9jT50WZ8Mu7hpx/JwUCrAByyJ8p406haFwMwJ?=
 =?us-ascii?Q?sD+4SJQAvhEBHf3I47VQNiqzDS5qxinkorvfIDFBUJHBMtZsYBSR6qkO8gOf?=
 =?us-ascii?Q?vCKgbcQSN0xunyjnqpf9N+8axf6chcyN87ca8rLMXNbmC3zGct0uTV7NnBHP?=
 =?us-ascii?Q?31h7O1XrtnTGKs1NBvMb8K3KkUYO0w9/pdb2yIC/xFcGiB8vGQRRxfFX8f1q?=
 =?us-ascii?Q?aK9YMOGFn5OCXK2+C+2b1dvjK7JSY9x+4gu5AodO3oybtqENoZpfmKnRzn2r?=
 =?us-ascii?Q?TqontTAlKirXSsHR6p9uMU8UiqXRBU9iyRVR02lCDndajWHOEC7yr5eD+iUD?=
 =?us-ascii?Q?LqYScXaaIIZLAQ4vzUvdq/7QI7NCbdFgUzUiQYaZvrTOg68syTV1YsyI+6qA?=
 =?us-ascii?Q?QgWbYBiN4FCPWieTrBcSTNi8kPKznupVa/ZOPpn9KS/qpm23k39+pbgq9Uez?=
 =?us-ascii?Q?0w2NwV/K4s5a3dBuwnZD+ISksjRgLpqAJRAhfoyma5Wzl4Ikun4IYfTlXyXF?=
 =?us-ascii?Q?7KeZ4j8plmZh9H/06cDtv5U1sb5l/DJfo+XK6C54qNLoAuQMcCVx5WHJaH24?=
 =?us-ascii?Q?DMPZgNs8LRWZLJY9wYlSNtjpCjeJHxkjIYhD75mYloK3z55yCu2MEtEJxFLz?=
 =?us-ascii?Q?iLvphHG+QwQ8nP0GBturD0VoIbT88OiMukitOnySSZxmgtfhMAQOo5/DuYyZ?=
 =?us-ascii?Q?BZvL3nCue5kfcrHqc5CL2smis9CXsPxp85T87rDJs/jbDzHfng9bMQIijmC7?=
 =?us-ascii?Q?jOoPaI5PgWGi99ro+9GS/KPkg5px7XMnrM6uornhiKPExlqHHFg0UVtkDJAY?=
 =?us-ascii?Q?Gwmljeubj4GugIKgviWbZckqaQALqQB5QLaw+n8gHeuQNlejjBSDlkQaPaLP?=
 =?us-ascii?Q?HC3KDN8I2gpl0CSDsUnTcxEYIq5ydKuvWEA6mLdDjpZ7dQg7OVcWuIDx4SNu?=
 =?us-ascii?Q?7NDE7wDRLJNbrgIO1Ymh3fW4tcy+1w5MYlkGbNnTIvKU4S8UrqJT4Cv5L5SJ?=
 =?us-ascii?Q?UwQ3cJG/yTq/DG6hjftEw9PH95iwe4BNFAFc95EXM8iZWinFXZV7zrJMwCNC?=
 =?us-ascii?Q?SmwtnYmQM+WyTVpO9kkgUqEso7lyjt7KSzqAfqlMlEkXG+6IbvQTyWg5aKGD?=
 =?us-ascii?Q?rQePfLvu5SLpjnr7/2spe3F+KMsYp/4STsq517rLmnZWfCSDIZHpkIbqB05M?=
 =?us-ascii?Q?KCIGSw5D93WucoTuFNAEBy7nbz8Xzm8+ibO2ktm0WDiPP/Jm5qdsJFNJO+Rd?=
 =?us-ascii?Q?OPgWKqgQGc5835mH/s5P5YiHeFTVzlED3TvFQ3Y4XS9TXcFDdkG1SLJo7e7o?=
 =?us-ascii?Q?Z6JBjlpd0YkU9SIcygbgkgXMMlcXuSeSPUt9F0eV6Bx4+ugPK6cc6IfeGkmG?=
 =?us-ascii?Q?EQdU+HS0seuCSq6g8UKagMCsbOEGUKORL02I/C6D3z00mxsGBa4pt35EiAwv?=
 =?us-ascii?Q?oNVjos1CJ12gaSes0P/FStX0AmjvI0QvqaRpre7DeKZrNTHKzV1nnVs8w+hW?=
 =?us-ascii?Q?h6++yxZI3xP0V43iy1MEmrrPwslNxlKYppoYWwdSsqvDXeZWnJ44dU0TmNEx?=
 =?us-ascii?Q?daAmypwnJyqOgadpgYmZqnKT3227g7Sl1IYjnUt3YvdrtyqcrAz2hXDgpcPg?=
 =?us-ascii?Q?ll5P5EsHsUb+BkAEtaBBeNWjxnT7FbH/8SKtJZ8i5nnuaFG257pON89p1+bp?=
 =?us-ascii?Q?HMJpXZWc6A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lUeZu1DIEFc3sAGg+A8rUIlTrH37NP3nap690Eh40s2ONzYLGDcLlF6i4CI3B0s3e+HxbjWO86YdxKZJ6M+HHXXPSHoJVnEJnwZpXxx7HHD9Yhi80gZBxdBy4APUgakBhahM51Xt8zlvuuMCOY7Qvfm8+noQuHB881HK+QMlzYbwldCkpNX2qyoLe6xEMDh5nq7rpDooc5IEFG9yDoc2oVLfOXPXfv2dkBw2nvRxshThjjHUUWJrSS/ITjv2PT1C0UGrPRTqkk0S1SuPLvcmR7+G09fqmrhlDs2jfRvQv0BBWR4IqajfZ7QL90Rgk4r1TJeRu8fIn1yODf4kmxRDhy4Zs3MyuTIJThmzOO4/igaLLXwluRh8YhZg7ltwijDhyoESBfbbZ/N6/uY9Ax5/ft8cQRZjGq9AbNBQ6okLNv4kQefit6yHwhYyOsfUzFIRodDDHgmOYJ2wl7JtAFr6UGTX/lcicODnV2BPeRYOnECqrn60/Qh1lpxWnheyHA7pqb5QPQmwdqKZfARdkF9fj0V8SsY6R01eTf1gBKHun6W2FO24l4F9VqXfB6QeUbvWLfhWN2Uv1o+Qswxf8eHl8CqQ9P/aIL9/Jf1dGs6rUbY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faa7573e-7ba5-4ec8-5e42-08de553f2bdb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 20:38:14.1420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUMLdVxXwKadX953sKEtctuJZJHl2fS+9WHryw9A/wMPHMmPWogcf7icBMaF+ddMZY6Y/6mJeNeOqM+giOcbtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6335
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601160154
X-Proofpoint-GUID: IvcrebePA7fiaK0JI9c64U2p4mc6VtOD
X-Proofpoint-ORIG-GUID: IvcrebePA7fiaK0JI9c64U2p4mc6VtOD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE1NCBTYWx0ZWRfXz6je6GoB2n3A
 jS1+9MSLVuekmvq74ZBeTTE/iPVmUZhqyIvNjiIN5Bub3qFFHPE3bWVHmMmWwIhOElF1WAC6LRz
 0hes0xobb5KxeQTZyXeU0EgEoR4/xDtlOpfFPAq4KJK/WJw5DZx43kf8ygaxM2I1At+UqsjyZ7g
 ctSijvxPG7ImLz1jVGkUo7EIhlq5P8QdaaMdfY5TCtJNvNp8MHz0D3sYuxEL2Ia6pG3nRvWnEMy
 2+0WMyLLuXSCYUDhEPIjLoB4KmT1dO4fuT3KpcFo49Sp4W89r63DAsyiM9O6FKWYU4Q5xF9n9Ci
 irDnhIZ7CAlm46b4HGhHwM+2q1Ts2ZByQ8A2CzGiT6UOSDat3mMKp3ZbUXS5OYWi7AA9W4uK/DY
 3rR1XVqBzvuQ0ElOL8VNQQa8qTlqfw==
X-Authority-Analysis: v=2.4 cv=Aa+83nXG c=1 sm=1 tr=0 ts=696aa1bc cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=ue7XmivHplJnLnhbcKEA:9

From: Eugene Loh <eugene.loh@oracle.com>

Add a safety net to dt_provider_create(), to check if a specified
provider has already been inserted.

This also requires a corresponding change in dt_provider_lookup(), so
that it will work even if no providers have yet been inserted.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_provider.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
index 848fdc132..e073e1f2d 100644
--- a/libdtrace/dt_provider.c
+++ b/libdtrace/dt_provider.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -110,6 +110,9 @@ dt_provider_lookup(dtrace_hdl_t *dtp, const char *name)
 {
 	dt_provider_t tmpl;
 
+	if (dtp->dt_provs == NULL)
+		return NULL;
+
 	if ((strlen(name) + 1) > sizeof(tmpl.desc.dtvd_name))
 		return NULL;
 
@@ -124,6 +127,10 @@ dt_provider_create(dtrace_hdl_t *dtp, const char *name,
 {
 	dt_provider_t *pvp;
 
+	pvp = dt_provider_lookup(dtp, name);
+	if (pvp)
+		return pvp;
+
 	if ((pvp = dt_zalloc(dtp, sizeof(dt_provider_t))) == NULL)
 		goto nomem;
 
-- 
2.47.3

