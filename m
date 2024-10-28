Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC801DF96B
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 18:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730140430; cv=fail; b=RmjB/WmDS3zYvTM+LqW7TRMBZjnDzXEIQlWM7wJQwwG61w3wXpGjWpjuy3oK5QTwNUnuP+LcN07dQYYCObiKPtxb8vdz4KF9hEJ5Ix0Rvq0zxxa37o+6yPy5vESaOND8dLX86qeB+4lhfYSKUSbGJrSG96wwFdLApKlh8uwOPVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730140430; c=relaxed/simple;
	bh=pJgNu6T1ijaRB62Yk2LNJ5ztKlx3VpsSHUT2d19LfOQ=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=L87A4H8xddJtGw7HjjcVd6VOQ78QTDP1RJDPS/FxbO3gA7Cwcty8HQ7TvyjYhhhK9pCC8asNsEEnI3/gIB5jvaR5DkvB5IdwNPXhhkHM94EIkEbWRwbTR/mZx77vPaTLLv91YLa9pG+WT6yM0uAKwtc0bbMKbu1EYwGWqt4iSl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DA78JUpF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tYjUwD2N; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DA78JUpF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tYjUwD2N"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SEteJT020913
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 18:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=efRqr6Bunw4dGx/yt3OXnZEOYXNESSMn6rzPXfDjHxQ=; b=
	DA78JUpFL70j9rflZm43kQyzsbvYZ8YZwNt8AgP80Jh6L2A+iHdYjpOar0sbTbGr
	28QzahrkI3stkB24FDi8RqkWpAjJq3XBDSHq1qo12CDOjQ55oIXNKNd8RgXTMXiv
	F9wS9UDbHNCMvqWGffcCnG1KYwi07NNEeF6Pk1n+OYKdbnuXATpoSZI4MDcytpZ7
	kt/I8D6zoHKS3Jcn939Ui5r7fA43Nob/Hv3HBxb790T4Rr+5zWeps2wmi2TUBHKR
	Gxwd/QaJye/+qjdpXvEzSHT7cfldeElfCiijrHUPVa6MCUgDPYJ899ARSQ/TQmzU
	aGj6tbFLjd5ApZEBrUY9aA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grys3myr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 18:33:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SHqRhq034856
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 18:33:45 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnd6bmbe-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 18:33:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1R2u6kW36Nue8mpb+bs+PRTvA4EY3BoQf0UB/GUMaheuDXrKvDFQdfGFpgBgGv1WdNaJb7d/yxTcp3g2TRh4QyIXZuvr8QFYS6wtwJNtJvat/UA3S/FNSEWcwj7Eg6Eh9UQCRGUfVQio9lZ8X0ufAyYZSk2r6vs7JR9b80n9XobXJm6LVfMI6OawkmUGuRlzD2hvp8Ux6wnXH/4LAwkpMAHwcSF0K4ogl+Dm4SD4q4rGncWrdoOpP6DA/w3MCTBlvZbwwEomOSvlUquzNqCcyL2CnFF8hS53V7zZgtYXWIVSuyTFbKI+8cAxhK4I2NQ32JtR8EQh4EknuD7GRRrTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efRqr6Bunw4dGx/yt3OXnZEOYXNESSMn6rzPXfDjHxQ=;
 b=sLNEnAkYlOSW5xxqDPWbSz7OTTQhRKRn/2YByOKhwdAy3JaaYOJaPZrpuv+WxgSLia3xG0S7kjkHh+3IdCCXR9L6p+gDquTGOJVBv6nQbTs0TyJHeFsg7xKfuACE5BVyuJhC8ZefIjVwYzTmttZMhwxTwYSqxNqVu0s4+YrNKlHQ21C41LOerSLjfugo3ZWIrhAO9bnRFjZDkgsFrk4QqAQc8xpnbEK50L+fQQjwE8ZThavi/qdk2yQHKEHudQKJkgHHJxwvvDyZrJ5OPnEAG8cgv9d3pntakSOjj1AAJuAjw3hMBUHxwxXhgTGThcetdy+B1cCbLhWZJuSVwmKYUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efRqr6Bunw4dGx/yt3OXnZEOYXNESSMn6rzPXfDjHxQ=;
 b=tYjUwD2NkqoJyCTLsWp0n4IAmBHDuifJ2BXumnoSJzy+niU1siB22WWfbrVQUrjcQH2WqS9LgjTj2z+cWhL1nbeOwT7lqnLx5LCclmzyGW1QgiSdgbckk64paOsQh0HUoWFUenM0vd/1FqVufGFpNshO8mb7OYKUXLfXOIey7/o=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH8PR10MB6621.namprd10.prod.outlook.com (2603:10b6:510:223::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 18:33:40 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 18:33:40 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] test: Clean up tst.specopen.d
Date: Mon, 28 Oct 2024 14:33:33 -0400
Message-Id: <20241028183334.22140-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH8PR10MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff93b85-e8a8-49dc-31c4-08dcf77f0b49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oODwrTrDRF2PoTRj6iSOpVuhnIOcx27mRgXgflbuCHnQBSVkYtYMtdK4t/Z6?=
 =?us-ascii?Q?HY6/yNnLkqCTSC1IjOIfGft/+UFzUPVVZjkng0jbehBxxRhsGerotB6Ijq04?=
 =?us-ascii?Q?3U6b6xyr8zNHrrOtHNR9dRzistEvSxLzAdcOe/rbjQtVpBOz7HFRHvYPWL6I?=
 =?us-ascii?Q?b7GoRhkiRLNrVKRjyItjIGCpcRF9STr1PPn+0BZtIjJzOWlgQq9tdiE8/6T4?=
 =?us-ascii?Q?owmqmjWE23h+pMhuoVjOxDKETT3nHl0+T6u0wMwDgRXhS4AtGY6h81PEO/2r?=
 =?us-ascii?Q?xHymheRo0fV667UNqhQT5FmMck0KDUtBhXrukYqmVaNWK3G5p6r4LxxWs4wG?=
 =?us-ascii?Q?U0xpQJfD6cbJ2K5nnZbP3+dxwNgi1UvbEBXCu0xNV+jrbWFP4kTxBTSngUdO?=
 =?us-ascii?Q?lTSVuoe7b+Mlno1LZFRYP4fODyMiD9RkzEfkGfz0kyTPKtUki9HOL3m0etFT?=
 =?us-ascii?Q?nob4uMVAvMIgAOzah7efWBp9aGjIuxj9EBXQgb7bifFVla6j5lKq6AmbUx30?=
 =?us-ascii?Q?fwnxmRxtFGHfUa3mGIkk8+jUEY8qNws+PUn2S2l9dU/dPsEvg/ZbleDyAUhx?=
 =?us-ascii?Q?1QD91UvyZU+ZbOkEyQrn4u7hseZvza00j4Y5pKxi1ppAehiItCOJ2MbhFUJ0?=
 =?us-ascii?Q?8igB0zFVJfzaLTLl7e/EXRlpzExCsKevo/rIsYSZZuqKfv9qR233jUsVjWr1?=
 =?us-ascii?Q?Wi9x6o4zTMFCb8AyQisYgs2HqYgyTwKGmc3ZYFNpgyluOPTq5EBebvRT1Nzm?=
 =?us-ascii?Q?HE/bgNYPBpR+hBWYCrbNcc00GZIwFR7wB5OSv8KCopJACwqudLWJjgsCYFDg?=
 =?us-ascii?Q?sltj0GCS/Y5i/hT0jecju36YLlTy2TnysVtL37IMbhI8wU2QvJBX4npZGEDK?=
 =?us-ascii?Q?6aVrd5H9E/8ejiqMjQGkYeBgV5bEez4NswaMLpYE1p/jU619iDQ2sSnrQEPw?=
 =?us-ascii?Q?KaI2VLzHsvgTURU1Wom3WKmm5OiXtrL5D+YXbapMLTx07OMFoelX+L+rvy3H?=
 =?us-ascii?Q?HDCPhAOk2qA262T5xLxHvWtztzbZ3MD93WhZEun5rhZsp33qzEVuWBRGt7B9?=
 =?us-ascii?Q?CtPHAmaEpJkMlJ5oIbGnMEibxSU2yhCrFtyoRm0F9Ie66VqaWlcpso1zHUlG?=
 =?us-ascii?Q?H6NJla99X+3dp3v0UhUpExLOBnVO3E02fAM1IPlk0s87ayxOffz7tm/5NKL8?=
 =?us-ascii?Q?FC+7hkuy0gXxYVqlbVseoD4IaM4ntZ3zhuJrT01MVdAEYV19cB6UXdLHDVNi?=
 =?us-ascii?Q?3avva0kyvNJNanCAuAiSfWNzknjyI41q7kSV/TA/ry9dK694HInNwow5l8aT?=
 =?us-ascii?Q?2dtFa4A+Jdj57eGRcmneqnuW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dGLiJRRABPI7izh49koHyKAZCBY8eyCb3KwLD3VxwDh6qJkZrKKx7lhmN52H?=
 =?us-ascii?Q?p9En4stEzXOxq7VcqpPHPy7YmYcBUE+Ov/zGpiDl/K7GNOM52fs4F597t0a2?=
 =?us-ascii?Q?Y8h8U3K6hdfOsUDb4jyREzl2LmagM5brHvHv2mGLch7ac5A8bXJi3yn9VNmd?=
 =?us-ascii?Q?VGN3Jg9Db7pzFTHFwxIGCx5WUwIYFnryCqR37FKt1vbRbogbyCNqrQTmFI7L?=
 =?us-ascii?Q?d5pfAqTfw0K8fhPkQo+nY4/JALAm0S9QhWYN6kbMY2tr/ZWRDLkg/azOvR/3?=
 =?us-ascii?Q?7n2n7fkKH+qb+0FeRKLM6w5BJH0SbJKCqf+c7w1psaVXyMiP98JFk6g3/Vbq?=
 =?us-ascii?Q?wAnfLwd5ewRLGVuO3qpx37oNflT5sK99Kf7Rnbo8Qw/BgOQjX9PpwgKM+wgv?=
 =?us-ascii?Q?ew53SRRRdWC6mPI6Kue7z8Ldspt+ngWpqsgUdtO6ZN8wq+SuHShXbZUiJfyr?=
 =?us-ascii?Q?S4jfBOgM0uPAitmDoWqMVqIn1MzhJW8eyJFoE9TudEFV8AQS6/d2oJ58hYCh?=
 =?us-ascii?Q?iiHJlePHIsNgFdkRLARZYGaSbVebdd9U3JaW2dv4OJUVkCBkolLhoGOhzr4P?=
 =?us-ascii?Q?zLh5CqOu3Yvhd5yS7O8nmpn22En8hLlDSmMCGv7vlv4PpvLL5qR+JLWruCOR?=
 =?us-ascii?Q?W4sBFfvb+Jb9sLNRl4cHRGUCT79QKXbzbc0OCAadWjlpASkY42OC4HdyUjNH?=
 =?us-ascii?Q?Vr1cnzGUm+V/hQz4KDd3al9/1yUTB2t2ZZahzCcLea05nOHceXpJb5TyZE/O?=
 =?us-ascii?Q?iCvNB3Nl1eKJq05mG+4i9HEvSq72/fGiZgReGa5AI86W5KwMgy07Q6rjvkMv?=
 =?us-ascii?Q?etPXZwrcnAQJMY5JdWpEDtSHhSbpDeEeSJbPuw5rEskqRu6irON1GmPT+ld6?=
 =?us-ascii?Q?SPWVvqa6KC/3m00CLbqhsFk8EdcunoN6tlTHh9fGGnqLSBbAwyUCd0mkyDUM?=
 =?us-ascii?Q?Trees3gwPZVmaFLDpDF8Z45t+5TUNJxPb52sFEXNb8tHVAy40WnLMf/9RLUC?=
 =?us-ascii?Q?SIuuFYEcVuzOd3scy3A61CGkEPI17tQA/xChJL1Bw97L0P6VLOs56eerAbGO?=
 =?us-ascii?Q?G027Iwx4NejDJI6mtDegxKF7vR7QmgK7Z96OLZE1biendtVeX4KMHXCHK9lR?=
 =?us-ascii?Q?SkxO73wRKQgT8rfx9LSFwRwQfargJrVqCyUjIPXCJSfD4qr5zEPC0G10l1AZ?=
 =?us-ascii?Q?Hvg93s/xoYyJcn/klPoXSO97zVWvC/LwPSNRsNe2PcWtRfd6mhz59pUEsmfk?=
 =?us-ascii?Q?0AQ37Ji+YqbTibnEF+2mYwEaRyxP+TBLkpYKZcH2kkfc2++vH8LzydsMYSIT?=
 =?us-ascii?Q?Bq4dLszD+F5/C85QFQ/ZHRLhf926Ws41MoDm9v9Zry2ySi/9tnMT9uY61Cfk?=
 =?us-ascii?Q?bXsmeJSPxkIY233WOwIt6uVwxhSNR/yNfZYJsqsQodaIZr9QDWCpy0QkdvJl?=
 =?us-ascii?Q?NTdMsgMgnqwKj1SJFv+IjwW8bg919cd471FIZAzIGuDWeelJq9HLyz/a/QIl?=
 =?us-ascii?Q?IYgQKTCMahfWAPuwjwjP/TplFqbeF97cgKfI8eX/P4PyNNCBkefJP2rZwVje?=
 =?us-ascii?Q?/WKkTcqQrbPzImnHf+J/nmosjMvx/Q9XQmAM2wZm?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XRBesi8lrpBO+ph3o7VVW/c2QguMNrtbvxUJ9sIoqUWffoufHZgqJJtONRdPQKlwkjVvOvdhqxUQimW0YwtNZZ1VU9ElFgdP5aVmFJ5gdfjsIkbgM94ND5k5qneR1S9SNu4itVnWzQjOs/LGgCowBxY7eeqW7npAKyUIr3ZFSM0rM2niXXlgsy2CCWM0tdIr3Gx77Qdc23V0++NiDnP1/pt/RmgcUwUtL0GaGoUmrz/RxzKXWIJsapanQ9WzsY2estUxmzL3k6BAJY6GhNAmsKXvQ5egi6QCJBnf2bs/X+UcJofkEbsief1sgkzh/PWZQbQMe0X2Z2jDNXITW3eX7y9muXd8pckj1Qokl1F6/UswKTu/0sUEHG/9Bk0H9S5H5RZIp0qVheJEKYhh00tWSFGAGd2l8LM2aKBIO6gAwS3xOQH6df5zjZv1N4EVmPL1u02isL2je6OYvT6oc5C+P+LNEe4R8bG+fx+rwGnxH/OL9zgR0MHnx3RBsgEr2SxADdXFdwMxRZ6v3/iNhBR74p9UBl+PT0f3z86Dc3TG2bjSPbP8Pypav4dcc16Qgy13ceZo1SbfR+5uHjFl3ICZ+Yrm53cVoo7uDRHgBJtnBzQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff93b85-e8a8-49dc-31c4-08dcf77f0b49
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 18:33:40.3262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtepFVyOUn+NPHRfBQU8LTSH4dzFHRTzntzDwzSNPY0gC3bN51CoFADOlzIOu1VYMtzzXYrfGVlEA90sCmyEBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6621
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_08,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280145
X-Proofpoint-ORIG-GUID: 7d6UGzszfxVNiGaY9QwZXOXVDHrShZZ7
X-Proofpoint-GUID: 7d6UGzszfxVNiGaY9QwZXOXVDHrShZZ7

From: Eugene Loh <eugene.loh@oracle.com>

The test does not do much.  Mostly, it is a speculation demo.
It just needed some syntactical cleanup to pass.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/demo/spec/specopen.d | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/test/demo/spec/specopen.d b/test/demo/spec/specopen.d
index c510045b8..700bdd9ff 100644
--- a/test/demo/spec/specopen.d
+++ b/test/demo/spec/specopen.d
@@ -7,10 +7,7 @@
  * http://oss.oracle.com/licenses/upl.
  */
 
-/* @@runtest-opts: $_pid */
-/* @@xfail: fbt provider not yet implemented; needs a trigger with failing open()s */
-
-syscall::open:entry,
+syscall::open:entry
 {
 	/*
 	 * The call to speculation() creates a new speculation.  If this fails,
@@ -38,7 +35,7 @@ fbt:::
 	speculate(self->spec);
 }
 
-syscall::open:return,
+syscall::open:return
 /self->spec/
 {
 	/*
@@ -51,7 +48,7 @@ syscall::open:return,
 	trace(errno);
 }
 
-syscall::open:return,
+syscall::open:return
 /self->spec && errno != 0/
 {
 	/*
@@ -61,7 +58,7 @@ syscall::open:return,
 	self->spec = 0;
 }
 
-syscall::open:return,
+syscall::open:return
 /self->spec && errno == 0/
 {
 	/*
-- 
2.43.5

