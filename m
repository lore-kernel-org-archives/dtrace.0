Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38F5306D36
	for <dtrace@lists.linux.dev>; Thu, 22 Jan 2026 07:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769066626; cv=fail; b=BTfyc8nVkn6LNww2j/gPaY8RyDqC/vYbBrUd/FmCc18aimvl1o8KGi1J4RG0V1792QVwUv1f49mjZozTI1S85dHgcg0BmBnwdJSsyNCkT9LPNj7s3A0fsQzBMXKuBoHWrys/MEsM82DXMSycOIRUHiioLTgWLMBCQxo/ruKRF1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769066626; c=relaxed/simple;
	bh=qi5C0tt2fY6FO5Fsig73gW8QZcCXrlhnlBqb4qucwUo=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=SUIbI3dyEnoOwYbNfOytHO6ciOMYJrQAouYES6YMapvx9kFQs6p0jIciJEi/E+qF4BR64oDLSPz/ViM1YZgEGsmgahHlQHiFj0IqtTqAboFgCo3nhxfKF/2CSo5H75cvBjbeodaoCsu21FYpBUFsy0L+rKm28VrCTiL738stPWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VgZV/HKz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Zhm65eTE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VgZV/HKz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Zhm65eTE"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LNFdwO3029196
	for <dtrace@lists.linux.dev>; Thu, 22 Jan 2026 07:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=+gFrrLwgpIaFqyI41Qt/a7rZzNw1YselQrWIzNXUAic=; b=
	VgZV/HKzfslnrtauBDum/gWF5J6aCbpWehPPUdF6h5e4OaKzgTC1tRJeGJ70GZON
	83msBAa1/IpGBlbLjYGrOna7vEq99RhnFH0vtObszzPJ04xJIv6Xv2uTOV0I9CEP
	TCDtDenTeXvId6h0GB6tVhsf8UWSSFVHYSd4YNEfOWgZji1JuXC4+QFlyV5FiJ22
	QEBMvyRdFFeHE4VBg5I1Yvrq5KLuBPV7g2gZc9MFY9RxAEjggSwy6vSYYTSCkq2V
	54eojeBT7Eu1khhM0nCHl/k2fOrX2ICja1jk/cUw8+ogFUe7ph0w9nNcrpanVq67
	qy26lYonjeLa2NY0d5HjYg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br10vy97g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 Jan 2026 07:23:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60M6UhXd019076
	for <dtrace@lists.linux.dev>; Thu, 22 Jan 2026 07:23:36 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013003.outbound.protection.outlook.com [40.93.196.3])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bsyrt9j6p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 Jan 2026 07:23:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XyE2CJDmnMokI71fUONITl2SZDNiBsiqKlh0u2Xmr0nnRkrBDLPaTH5Es30gpYI1x0s2aU+Tib7k8TucKDF8m3uOxlIZWh9GwsT3r20uJpXw3nlvEl9dMHwmIC3aHsqB2dXwl8R2h2d+PVr2UgvTsTagQtQf5fjJAg97w5Xp/jmMWEVLJURmn8Y9m6Q+59Fz40A4QqNxA1SOUYs210E6l2gePaSpw+zdTBp40ITWGlQmFuDasm8ItQtSY3iOTV9zAN0sgVz3UT1UP+6t3AOdBSFSU4ppt4mfGoc4NtJZpwDekPr9G4by1NUrgEO9ZPSVpOmutOCptQq67gTygPKzMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gFrrLwgpIaFqyI41Qt/a7rZzNw1YselQrWIzNXUAic=;
 b=omS98TkeJy0B7ck7it6+c/Zt8zgR5so7U/587XDeBDfGnbvbvQb8hqrbFY5f+aujSJq1T5f7XY1LZO5gX9kTx/V/PttY+57x0Bn5Znb4FG20PU0Na3VqBonb18Xw8Me4Pt6FZVb1OV33JY9x17P3uOud04Pb5I1hrLy+NFqG10U884MLpYFNiKhpz27XG2bLip5rOPV2B3UriOtx5OV6n3E0odbpLq+V8nX8v8M1EhrmNtJu6BD7zvFmxoQ1ra09lH4BG4wcVYgnv/DBopPGVWu5yKwSmUIBi8HUuxaN3XTjCh6vSbHonVE4lzJgFj1M5SUoSBmalGXIcYKzzyUq5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gFrrLwgpIaFqyI41Qt/a7rZzNw1YselQrWIzNXUAic=;
 b=Zhm65eTEUKEWCx4qRU/TIduaZ6A+fPhJQPEUFky+hNSvIP+6NIvKk8uqlLlOLAiH/InWBObJC1w9uMOZFhYIAFqOmlNAPVGNQorO27AJBrwi41VKRBO6hNQHiVucSV5Z/Wae73goWH13nqeYUefMCQ1EISxg7DdSQ1Jl4lUGe80=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB8516.namprd10.prod.outlook.com (2603:10b6:208:57d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 22 Jan
 2026 07:23:16 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 07:23:16 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Account for readahead tracepoints
Date: Thu, 22 Jan 2026 02:23:14 -0500
Message-Id: <20260122072314.10617-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::23) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB8516:EE_
X-MS-Office365-Filtering-Correlation-Id: 96737055-322d-472e-a84b-08de59871bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WMkK9Eu3nxyqm7uzZ6C8JyTk/Wn6/PF2EMvUKnLMhF1+BIbBXa7JoSn9SgGW?=
 =?us-ascii?Q?GFAcyC3KFLRVOuglXKZ+f2s/uSfFdrWEzPZABow/WTTk7Wkvzhw/6QWCcmwf?=
 =?us-ascii?Q?D5I8j+IMHQn/etPdSHuDtcxwYXsQVx/dOP4O9F5jI8EDT72/WIK3CcsMk5Cv?=
 =?us-ascii?Q?nWQBtap0wOM7eYPE/WnfcY85bFFz0mlFODzs5EWT/fqNfD0mgCMsSi6zq2ao?=
 =?us-ascii?Q?vfg7ZLv8TPR4X8f/qujwQmACKfxdYIvOfqf5W6mtaD2ydTQAI7dpjtgUBvdD?=
 =?us-ascii?Q?/PndJXp7TAfZPDYHvgD5dIgrwFz3B2sRF0ltGG+yH0oBako30WxQFAW1rERU?=
 =?us-ascii?Q?GtXiz1L9tfoyOvbT92rjiZnDatkqcsB+MYjgwlVSFtWfganpMpJ2eWzkbu2v?=
 =?us-ascii?Q?nRefeojI7o7gYMynFgKrhWTZBSumvcfsKrLy5TGO2upocJCb9hQa98ppT20X?=
 =?us-ascii?Q?NU1Vo87E3+cLx5ny7K7s39szkXo13Yr8L+VRPz35MsyJCsiaBDnZc0r5qwy0?=
 =?us-ascii?Q?88hKL5xKtERD1zbfTy1yNPJx3zOGjUuey3JXTHXarFxpcLPalkMAtdsibtbs?=
 =?us-ascii?Q?1lzbGNrm02z8R32FutGJhMXefP/c2yU9YmeQexV6Jvx2gGNaFpNh6OlOUD20?=
 =?us-ascii?Q?mk+qtG3HW5uu9tW25YZLfVUHvOAhfmN0m6cH3A6il1Xxtz521ZCO7/zUekLp?=
 =?us-ascii?Q?KUVSZm9Xf8VqmBheWiO/YAiTEj7xt6pNS0zSFPR5c5GqQZwdtraaHjksdWve?=
 =?us-ascii?Q?erKIc1NEwO67MKbhbD21Iz99oir5vXTwe69EPW9s7f16YZKnWEOsHm0W8MT4?=
 =?us-ascii?Q?B2ify1sEEs26KtcsJgr3ylsVRL2zWTOtnvDi+PbHlFMKe5ZHtwK/YIt8OE/l?=
 =?us-ascii?Q?Eeu8sDKkUXqlPGOqjI/ClOZDHkIOgebExCqWkXNn/61Mgs/tTMzGLukZdx0Q?=
 =?us-ascii?Q?EWbOVGFxJpb1F8skacOzh5tcd1thljOZhU4JzzwoI/v78dHv+t3fD5phdvS9?=
 =?us-ascii?Q?el+3dvgLIJQAK2jY8bg/yu6DEh4FVXCrzIfMJFh3+aIdUU4fLEIktYnVlccP?=
 =?us-ascii?Q?RlX8LoOVcBel+at6o/Bmkl0V0wUAMxIFaE+UYt17bHmGqTA1T0a1Ma1y3ii8?=
 =?us-ascii?Q?TIg02zP6QGuKNLFDeYzYt/OBkbzb0qCly9c3UHfx/wzFw/9/TouQAyT8qiQJ?=
 =?us-ascii?Q?2uO4ft+Njqfi0g85vc+yRVRf9r2BPtHpuL7Zo62FrK7eclQXgSDzmjfxnDNY?=
 =?us-ascii?Q?M/+/DyH0ruykhjO13Xzbo6I1TeurUaWWKVflo1i9lRYETC3DZUaShl2Q+MFH?=
 =?us-ascii?Q?/OYwX4QqMDlMwC+FFE0tCE/qw5qxN8G+yxbf8Pnjz0Qr4yZOSLIuUBivM7aA?=
 =?us-ascii?Q?NnuC/uX+rDowNlIptnTCnE2FUcomZw42JlsG8QIvVNopChzms8fW3rfJLZqB?=
 =?us-ascii?Q?6V7e+6JvXtXD8QeGKIp88WQucQSe9MOIb+TLAL4kqz0x3uYPiEJcEGvgx4Ul?=
 =?us-ascii?Q?0Qz/4W4jzBFaWYieTzUAytgVjFy7XkGRS+VmcBoT4MiN3gKjqnoKWohLUst9?=
 =?us-ascii?Q?QLSoquoMox2ebPgBDoY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WPNa5I/NKdxbdPEhAwmvHWQxc0Jq3ZmxbzVU3LPAaX2/XKIRmA4B+M1l4NUz?=
 =?us-ascii?Q?LUH0FYU/NMR5JzvA/6K3bzyHwvslZZpbry1adUty27TY6Y3GQ9fbvQHm16Kk?=
 =?us-ascii?Q?gwjD1gNzsYKsx8t5qnGvwPFnw8k+NWTaylRBmKOwP+A87WMkMg4SZV1fXSLJ?=
 =?us-ascii?Q?9C5x35zyNeYKph2P8Ea496Vy+sOJEbq9Uh6CrhSfRRqMVpK00xsUXF3b50ZD?=
 =?us-ascii?Q?SrFURHBun23Ou83Cz0Q1voEbfOg9ssvET766bEL0SoH+0EP8JlK/0gG88t/O?=
 =?us-ascii?Q?MCYKbpFXDL6Uc0eLL3W7o1FFCWbF9RFncKt5Xp0aDp9cYIMu4+a4bOiZHoUj?=
 =?us-ascii?Q?1CoCjtpTNbQEfXmU6orwO5f49yXXDOfFP1YOtFXdnL40I9TeGcBJu+nD1oNj?=
 =?us-ascii?Q?KkjvLGsl6+w7J2C6kuVC05oOczpVK1euO4HBqLeM3U5PfYPN4AFNcFE1A/bk?=
 =?us-ascii?Q?C9vValcPYareg+crqR/CxVaDKp6iZyJobZ0iQSS2l0+FDamJsVlhCWKjTQgZ?=
 =?us-ascii?Q?sc+UAGIE6G4lv3UPK9c8NEpdx1XIjf9INLjLwOH2QH+GTtHo0Ndd48cI7gjN?=
 =?us-ascii?Q?NMh6LXMDFBmkunjn5StAcqPUG27JsU8sX1+AeZfxIg171RsuY8gIcg72Y5fQ?=
 =?us-ascii?Q?/9JrpeKACqCufgRst0fV/seX6iC2Vu6ZvqpHk3nF0ant8SaM1lC6PM1Lgkaf?=
 =?us-ascii?Q?R6LuMCy4lUPggOD/dVxOKtSWgatOJPpjZZW3aSgVpEenflSSK1tSPuUr0iNi?=
 =?us-ascii?Q?mka4Prepjcx4wqwfcckWmFtrNg0WG4Hfh+dT7eEL6/lIoAUEbajpziHxA6u4?=
 =?us-ascii?Q?uagiOwb9J+qEkKVz4umTUXeDHp9KLxtARh2B2YAdMR4+XX1CyXMjja3nbFK8?=
 =?us-ascii?Q?AOssRYwMI3btzl3WQsovKaftLvzfmeYR9l6T0fOgPmPjhbx5ArRELrc/quvy?=
 =?us-ascii?Q?llma2M/IT9bPgvThIJ6IR6piMB6jJchwIpYRrLnhiFrZQSiSMXTNFzFJvEw+?=
 =?us-ascii?Q?Ez1Zk1EkBDZHkRGPynVWFeg5WjHlqqCAfqh7OUQk4nhDEA32hTDl8sAj2SbS?=
 =?us-ascii?Q?mh3TDE9YpRim+OyVg5yEg0qAWXqS5BbkVkY7KTZwnIpuyihQc1yqUJXyfAc3?=
 =?us-ascii?Q?3cmnqssCyKCMEaD7SLW80j65un6cjBYbq5ItB8TWOVh+idZzJFTq59drbsTI?=
 =?us-ascii?Q?Sb6PZPVCIy6g/z31LUPvW5tK1mi7wJ12Q8ngXyVd34WJT1PFxZRx26kCFkG5?=
 =?us-ascii?Q?VkbBA+jJzYYrez6GLyOfVIqH2bjCN1BSzHizI972WV8YB4lqR0iPpdQJAGxT?=
 =?us-ascii?Q?eKBPPZK+4WkgzXCvacB0kKDDpRhvxRwgOMDLrQPizWFQ1oux7g6iZzSgwaZO?=
 =?us-ascii?Q?HEvcGhNTLmXAkyPT4cH92S4brUWk5NsWBEfEHwaqNA44yhSoVdsX4UIFIf+e?=
 =?us-ascii?Q?cl8ny94mjpMRutkNuDJa+iISv/Hd3dtcbRa7QFUFR+Zp85bKxzbVjaoeiHWM?=
 =?us-ascii?Q?c+OTQtjfwsCPuU2A0/lu5IgVuk+vpfvHbyFWreVuZevgaYooZgIz24I5xz0l?=
 =?us-ascii?Q?4cEoLx2PF+7nYxx84rYtR8Q65eQ9rkVBQa1iGl9FgTyYMWMki/giHuuY7nid?=
 =?us-ascii?Q?aoYSj4qFTolMPzjyVpitW/1YYg+ptALCFs+n9DF3z7LV6rE5e6POToqaCY6n?=
 =?us-ascii?Q?2Kvs9Sl37nX+PWN1eTs3kDendUrmKFgDqumqfmAqdbehA4ZH1VQfP89Fgz4B?=
 =?us-ascii?Q?Ii4tcCFEYQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	moZP73wRHUgX5j6uKKdFas19n3nzDKP2pbHH6sshkylQLxTleAL57MPYc1aM9AkAqEJDC5t+llFxjO9uzx5e0d7P3ikBZM1sAeLs3fxwpFgi6dc9sR9OoicSqsUfyTENeFVSVpOutVL+G0QnK1ts5v18eUoFvPdBiTAI4LTkZqVVJ/WYVeAwiRRKXzuo3IFm0mNM0MQPTzY/pfGze0TYHXO/9hpOwMR/E6r1QrWuGWLJilriwppHNcPRKQ/Pfr9T8mteJq0Asmq+JOHH+gq9MG+0zThFIPhwWUXYsjgX2m0V75e1bea8dZGe8U8RoR+9n7nq+wUFDn/fvshckeuii8MKhTfpXkQSJZ87I1YRymoNf92VHS/9bruwz/tgBZODYk03TvykoGo4PJrMrn68B70dLdXkUg3wrkbrzTxA/Hk6EJjU7Ef57cqZCx0u4ecG4dhNslJRQonW1vlKHjhxzEXq2dJrFMy3xkRHJVrUB2TGg5L40lRNFB6Cs5iNvXq+kmJCr+a/gVBwLecR8QRZ2/+DJF8E7h16RbHJLpMe9MLBWV2fxX8X/ecReNji3hiRM4RUwIw+C10P+LG+wCTZnOG2mT9VSSVzBlt37Mvlp0U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96737055-322d-472e-a84b-08de59871bed
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 07:23:15.9660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yaRqiUstoFPDyWu8MIIQyudOrSwFg+BIIgR3QpI3OCIQ0zKsavG6uXlPRy/qObN1leVma4rmkTW8Jael+2pNuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8516
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601220047
X-Authority-Analysis: v=2.4 cv=H4nWAuYi c=1 sm=1 tr=0 ts=6971d079 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=ZZ1Pj8HtN027rhO_KyEA:9 cc=ntf awl=host:12104
X-Proofpoint-GUID: Wghz0g-Np8E-tVrJ9SAZl94OZs2-KdKz
X-Proofpoint-ORIG-GUID: Wghz0g-Np8E-tVrJ9SAZl94OZs2-KdKz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA0NiBTYWx0ZWRfXw502MgM4Iu9u
 IqTmHjzbQanzuxhIDCpO+HiawX46YXyQ3s0YfocyUScmEKiu0YMmIM6twRE1oJ8k2mD9X1WTt8x
 jHYH1TRBw74hz4Sb321oyWXIBgd8rBQVgU1/fTu3npnUlbpuenXqVXzer5hEJ3kh/05oTKaKntm
 MhcKWjesvXph5R3LmN2DfqnoGn4cc/A5ch5Gx12Ad6woecVXafk/umr2u6q6W3Iaw/+SMVNBCnD
 sLXjK4D/3ghKYpmFv1flrkm220BiAweT9OwfH8VGRlakrZFrLGal2KUA31xpyXrWnZYX76J6Aut
 UNerOcsNxLOjWHCQyYmkMLPZbJhKBdUdOmCPz/8ApkjGrURNmMrjSulfaBgKs8zztfkkseCnLSY
 BvO0cBPqsrqcsPXjAd/wc48AhW9ad2dmNgDbcJ0j2AKZDowek6VrNGIDFq1Rw4hhhNVHimYxGsg
 Cw9dGKojqr0jDeX1g003q5PbAa9HHk0PVBLqfEG8=

From: Eugene Loh <eugene.loh@oracle.com>

Some tests check for empty probe descriptions.  In some cases, the tests
relied on the absence of any read* modules.

However, some kernels can have "readahead" tracepoints.  Tests expecting
no read* modules will therefore fail.

Change these tests to ask for readfoo* modules to ensure that the probe
descriptions will indeed find no probes.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/dtrace-util/tst.ListProbesFuncEmpty.r  | 2 +-
 test/unittest/dtrace-util/tst.ListProbesFuncEmpty.sh | 2 +-
 test/unittest/dtrace-util/tst.ListProbesNameEmpty.r  | 2 +-
 test/unittest/dtrace-util/tst.ListProbesNameEmpty.sh | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/test/unittest/dtrace-util/tst.ListProbesFuncEmpty.r b/test/unittest/dtrace-util/tst.ListProbesFuncEmpty.r
index a1e11d575..616632628 100644
--- a/test/unittest/dtrace-util/tst.ListProbesFuncEmpty.r
+++ b/test/unittest/dtrace-util/tst.ListProbesFuncEmpty.r
@@ -8,7 +8,7 @@ dtrace: failed to match ::profile:: No probe matches description
 dtrace: failed to match ::vmlinux:: No probe matches description
 dtrace: failed to match vmlinux:::: No probe matches description
 dtrace: failed to match :read::: No probe matches description
-dtrace: failed to match :read*::: No probe matches description
+dtrace: failed to match :readfoo*::: No probe matches description
 dtrace: invalid probe specifier profile:::tick-1000: invalid probe description "profile:::tick-1000": Overspecified probe description
 dtrace: invalid probe specifier fbt:des:des3_crunch_block:return: invalid probe description "fbt:des:des3_crunch_block:return": Overspecified probe description
 dtrace: invalid probe specifier read: extraneous argument '{printf("FOUND");}' ($1 is not referenced)
diff --git a/test/unittest/dtrace-util/tst.ListProbesFuncEmpty.sh b/test/unittest/dtrace-util/tst.ListProbesFuncEmpty.sh
index 999f138b0..b5189b3f2 100755
--- a/test/unittest/dtrace-util/tst.ListProbesFuncEmpty.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesFuncEmpty.sh
@@ -28,7 +28,7 @@ $dtrace $dt_flags -lf profile
 $dtrace $dt_flags -lf vmlinux
 $dtrace $dt_flags -lf :vmlinux::
 $dtrace $dt_flags -lf ::read:
-$dtrace $dt_flags -lf ::'read*':
+$dtrace $dt_flags -lf ::'readfoo*':
 $dtrace $dt_flags -lf profile:::tick-1000
 $dtrace $dt_flags -lf fbt:des:des3_crunch_block:return
 # This is curiously different from what man.ListProbesWithFunctions says should
diff --git a/test/unittest/dtrace-util/tst.ListProbesNameEmpty.r b/test/unittest/dtrace-util/tst.ListProbesNameEmpty.r
index a89124b88..a2489f19d 100644
--- a/test/unittest/dtrace-util/tst.ListProbesNameEmpty.r
+++ b/test/unittest/dtrace-util/tst.ListProbesNameEmpty.r
@@ -17,5 +17,5 @@ dtrace: failed to match ::vmlinux:read: No probe matches description
 dtrace: failed to match :syscall:vmlinux:read: No probe matches description
 dtrace: failed to match ::vmlinux:: No probe matches description
 dtrace: failed to match fbt:des:des3_crunch_block:return: No probe matches description
-dtrace: failed to match :read*::: No probe matches description
+dtrace: failed to match :readfoo*::: No probe matches description
 dtrace: failed to match :::read: No probe matches description
diff --git a/test/unittest/dtrace-util/tst.ListProbesNameEmpty.sh b/test/unittest/dtrace-util/tst.ListProbesNameEmpty.sh
index 50c7fa0a1..ab2b861c4 100755
--- a/test/unittest/dtrace-util/tst.ListProbesNameEmpty.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesNameEmpty.sh
@@ -32,6 +32,6 @@ $dtrace $dt_flags -ln vmlinux:read
 $dtrace $dt_flags -ln syscall:vmlinux:read
 $dtrace $dt_flags -ln :vmlinux:
 $dtrace $dt_flags -ln fbt:des:des3_crunch_block:return
-$dtrace $dt_flags -ln :'read*'::
+$dtrace $dt_flags -ln :'readfoo*'::
 $dtrace $dt_flags -ln read'{printf("FOUND");}'
 exit 0
-- 
2.47.3

