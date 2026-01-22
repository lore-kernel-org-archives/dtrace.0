Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D4D33C51B
	for <dtrace@lists.linux.dev>; Thu, 22 Jan 2026 22:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769119344; cv=fail; b=Bfr8t+PQ7jvsoTzeE09wC1Kqnfu4w+Dp//dXAebdisa/lZupj5XqMIjKAVH85GwtpWhe1oeVgvNunZurKYlcZn/QsmDhzA/ASUjrIKYkVl4Gc/PWgXjNLQAKF0+E9gnNRs8AVKNUDQjvLkNnvN6jbpGx+RTr/x5ZIuAjXncrIOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769119344; c=relaxed/simple;
	bh=/K8Q3M0n0jn0j5Sb6wE99tp93ncp6U+RXNF5v9yq/os=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qXgHfcwx5r6btA/IUrUkxEUZk0HKZT+QZeVH/QQRb9vTwN3LKyydRKhMe+0sIxWB4TbL5WMCtcUx/+Thhhoxvpz1oD/YpopkaFGHMpG/Hxz5uOSc2TOej+7fLJZooLfqqPShsFQjpHXxqMUzdG0d3ESJC8H3agTkroejj9+D188=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hsbPA1X3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ixpK1wqT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hsbPA1X3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ixpK1wqT"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MDgHo71085698
	for <dtrace@lists.linux.dev>; Thu, 22 Jan 2026 22:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=bwcMKc5Ash2ZcAHjq2/cu6JMw3xqx/ftzT98OfiPNAk=; b=
	hsbPA1X3IY2EyPjt3Ds9z/n2wL8fvBUJZAw+FCMonDbo7cIkXq5oe1xQVkNPpkN6
	EYwQ1Gl6TVsDSmOUOztnVc7P9FS9rWreF2P4R9KgzCprpQXIzk/iLuxQJC4hn+QQ
	+YCotyCxj8/Ov3lLIBmo4TgBB+Pk0e0IBUUPmpzQMlbtc4YZdvX8hVfOtN97xk20
	PZ7D5l0ZuM0SGA3rJKP5LafPMdWI6CsBpfWnmVBiQtDRNK83G7ETJ2xtKKwxbCnt
	en28elnbv5KAWebOb0GTrVpMEq/JBrZZmV7vWJ3ogWEZ+OYTEhfarCSSzbrDIOLf
	JWFYylk0GDXi+9Yb6zGvlA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4btagcw4b6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 Jan 2026 22:02:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60MLXkCg022647
	for <dtrace@lists.linux.dev>; Thu, 22 Jan 2026 22:02:01 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011020.outbound.protection.outlook.com [52.101.62.20])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4br0vh9t47-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 Jan 2026 22:02:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJwENMVrTVOx+on3mS0N1j6HFNMLSzsaQ9pD5BxbKZ1b6anguqGwAjiyVYiqths7KVpIczdUPFUUcKfwE5NCQ14XNsfOAeqZdgY5tWj1gp++2nNHs2WU/E3W/a4eHY4ZS7Sg0zzHqZPKkro5zZvKBr3LQuy3lWbEZ6JYrzAFaiS1sczXcSW+gNfqSDsIaeCOIPRfhVz6qf2HnIeUGyL/l1VsM2ErWV9so+wDEb0gOLJ6NtqZQ76nRTsP3zWxR2UZA7A9uFav35TwrANMp7CTiN2M+iOdaB5RiafvnvUcIZUTh2IS6FgcMWVix/1v0gROClCyiliylYYlmm/spwhB7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwcMKc5Ash2ZcAHjq2/cu6JMw3xqx/ftzT98OfiPNAk=;
 b=QcaYzDGkaCfzsObEqWggU9AOE4mgVckxc5KScaVaO7AD717/Jm7lGP5Cgt8lzS5f/rmj+pTPIo53JnYYfYVxNhjgUx3jVJqp3ItQZrcUk/iwL8ReoVywq3/Y0eLABSlGB4qVFf1wcHS94KI6PNcEYeH1NVBOIna5Lye14B7TRaeuQfsnsAnMmZcvQtzc2q2OX/UpUVNLuc/ZUcxzpls5U93GVRfy3DLDchu2u1lZnJvTpR0cGbKh0HZcNMmIkP4vFlADYWQw3kg9CTJfhvvwpEJGT00OqOCQ+8fcslNrtD+szY7ajTe1Kq3yhU6VfXYR8U1VZGe+BmaA0EOilLO/AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwcMKc5Ash2ZcAHjq2/cu6JMw3xqx/ftzT98OfiPNAk=;
 b=ixpK1wqTz5Ko1r2beBwLsXnIIh/2jvnQqtSUAOklCEKoT7dvUe8qyQamQTagurT6tEshK4obTUZnlWZJE7z3fLSH8b5psKF5kmSoZNe4lmqdVpSwbXMBaWGCGLGqOxD5GwB40bhES6o+fFCDgqGbdn7UxkMhknYc9SDIypXOOY0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB6740.namprd10.prod.outlook.com (2603:10b6:610:144::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 22:01:56 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9542.010; Thu, 22 Jan 2026
 22:01:56 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Increase syscall entry timeout
Date: Thu, 22 Jan 2026 17:01:54 -0500
Message-Id: <20260122220154.20552-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: 703cc159-267e-427d-dbd9-08de5a01db9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qj9f0IIRiGIYMUpEv5+Zdi6T+CqY65UxroKTcIjCd+tT0BibT3I1Yw42bG7J?=
 =?us-ascii?Q?nslHNulAWgBC8pBBMnAYPC10kY+PM36E76WhctmcAHvDTqvTdxHRamT0vGcj?=
 =?us-ascii?Q?K4xuljDCHkKJ3gc+cxCrqtwxbLK9pLRPSqdZt5HWHG5eWiZ6t+txlWBlzN/H?=
 =?us-ascii?Q?Icq7po67sdKrI79Ift7t9KSizU4MtVZOPMiJRwfqKK2XxX2dVPZmbst0c3Hk?=
 =?us-ascii?Q?sxaOQWvZRHdbqHyP9DQCnNGQeO56wlNmZh/ic8R3898XxM3sxC9dlb0TxyZT?=
 =?us-ascii?Q?XWhrVWNqsqj4q+Xs88cWhoDQydDzwaV1pay2i9Fu9WTWlNdxvjYERj89o14T?=
 =?us-ascii?Q?6XNrc99hNw83xs991sKwGYSMw/tIjZKNweqouiKf6FFCI9jDiYMc8iVcDPK4?=
 =?us-ascii?Q?/7OeggVuQjnKDXMofsZDDWROG1RpPnzr+j5vhjjvkMu8C/LGkT90+ToJthe+?=
 =?us-ascii?Q?UQhM88Wt1qos+ZCra9l/urX93DQZPUhKtH0n9sAJN9lBdjbXYa3uuQT93Rgg?=
 =?us-ascii?Q?+QgM6uhV2mFfXMtFZVJdYh9OITim6qgNkdkgzQ/ItgpoHfPRQ1wofbrzW4N/?=
 =?us-ascii?Q?EbX+IliTQ+CfoUNf43s+ZwCWOS/e4ssFeukPbTVmYN2xccuHxdZrxmYtPjgQ?=
 =?us-ascii?Q?MAuTOhtEQ0hsi3aDspDxF3wzYRkbQMJ6994EuA90lck0Ajc9ZwgN6Y8W6GIX?=
 =?us-ascii?Q?HKSAQLkrNhRdHD6zL+x9RnnKKiSS58mJxw8CH8Mh6TNKMqlPj76zDxr/1ELs?=
 =?us-ascii?Q?6tg1QYle8NqPyj69A0uZZRUZHrM5UpBxFL3G+pm3MAgvS2QUeqWUemO1t9xA?=
 =?us-ascii?Q?BAQbpA1fyYquy/YppVvWxKketYeqlD33WLcXdDmXuMBGdEOPw4wtzgS5Twrp?=
 =?us-ascii?Q?7c48qftwgLqOwxvjzsYfxq8wK65iydxZ/tZ7JR/P/xUIHOfTU5viqfNiRQtE?=
 =?us-ascii?Q?gCvlIWccK36AslSI5H4VKIc9trvSzhFkBOOL6lp0TuZEYnqEAQZeDw7QzQFL?=
 =?us-ascii?Q?/XqFuBw/RUCzXGcDSD2A9F0BeQF8V2JJbJ6ElcKDURYcX1l4pg+LeBfPkVC7?=
 =?us-ascii?Q?FYFUKOryvH2ZnveMkcuVlojb8k7U+LMPurPHk6xUIGEau2plflokw7Wsy/FU?=
 =?us-ascii?Q?vCnzvvx6UDdlyCpb/KrTw1Qu8jhAiNt5hh6kGMwqgwAnrc8RXxBkilzREGaS?=
 =?us-ascii?Q?wlX2OLX/7SB43A42bt7pu6sDuRlr9L1blSXY9LEUJaWPvHRau+vMmauo2NJv?=
 =?us-ascii?Q?esI+klKeQEBNiX11lPF0PNr/VDxksiltgUwuWkXU/c6DMHjD/4BSz039pFcW?=
 =?us-ascii?Q?kSg5XYvdrMBw+8jHBSQfc39oFCyL/YNVvwGQz+AD0PkjKSZUbdDF2a1xZAdN?=
 =?us-ascii?Q?i1Qo65nqSYltTEoy2MvfW2GqkMK9Ex86zqmjp31w13JCNvM8SkfX4RUllJeE?=
 =?us-ascii?Q?gM3gz+GJo2x5yS3k5ozKR7jC/gKAdAS6F3XF+aUiomi6Hs2ru21r5SH21/Xl?=
 =?us-ascii?Q?/MfBSLAzVUJqXSevSMbUSFiGzEpDhXI9ircd9OjDvZkQyESplViLkUoHXPKW?=
 =?us-ascii?Q?N4dX154N+8IfXd1zARf59Sfdd/cbDG6pTyHRK0Ub?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a9rJfGIkadpuL7ew2nQVkUWb2egdH6uzg7e0KXcznJlZFIl7lQaJu00xRqut?=
 =?us-ascii?Q?J4+BFn4MQtiEpg5k8dQR/i9iGyn5QRzVpoqljc5raZ1y8wqDOwXIyO2MoY1a?=
 =?us-ascii?Q?+r3eKCNq7IZOSNPR9mzAtSggbxFNazcz9/q9Zf5Dq4o2eeoYm7DWpT2107G0?=
 =?us-ascii?Q?CNwXQiH1KlpwQk1VQTuhNTLGHCr+ONQ5kysrZFHNStdhUj0JhLsElvHhOg/z?=
 =?us-ascii?Q?wDM3Nhq34iS9AVl3qesPlD90H9IlUv4Htk792EPRYTfeCUntvmtN9tUA+php?=
 =?us-ascii?Q?v46/9IfWxgj5VienjDPj4A8ICXpwKiEhyEVx4GeTLIjZaahfhqOqpgbS9hex?=
 =?us-ascii?Q?7XekPPLIymAlkWfLfgZYxYcH503UQB1AKS+1C4fZzTDIMEri6ofSc6+s0wVh?=
 =?us-ascii?Q?bZ8SoeY1ZBOGC+MI2N55y2VH1HT/ioB+H/hHDEcJehZH+/0Wf6+cor32uRWY?=
 =?us-ascii?Q?8fP6Bqh+669FZKeL6dnCfqECLaieAygvY3mKvKfYhKYk9763UHzFyE+xSbN1?=
 =?us-ascii?Q?e8DJ53aa61HVZ6uLBVbNByC1D0vt0D+xiveaWq/r2LIezW9f/N+HJK9ADCxb?=
 =?us-ascii?Q?qADZFB35EJAeZZoCo1pbTKDGYl3KpBf5X+RYudLltxvncdRsGI+usTkehaGf?=
 =?us-ascii?Q?BGbi+BMVOcD/x3r0I3MebV1+++X8kKpI05D1Qie+PwU0YxoyU3obh2JQ4MAJ?=
 =?us-ascii?Q?WpuBAZxfyjxYmrIo4CkVWHqtKdxtTTYJZbVKlvkxSaMVra8HXOSCY1Udl3hh?=
 =?us-ascii?Q?pYSIbwcpcLGafMMLU7zmE7D4j0ZYlYkuMD7tXvkaj1BLbdCvQqZd1k6YxN5a?=
 =?us-ascii?Q?iUtgkjwVvxHDcYtukWoFUyHgVombPCLOx8hwXP7NaQPJOdbNZOC1DTQSX97n?=
 =?us-ascii?Q?IM8Nt7Jr3JkbtcixWASQ/xguzxAJuFbZV4vW9R4NW+pwNEApIr9UW3CeuqIY?=
 =?us-ascii?Q?0Umzw3tRJbPRy4OKANMVTTYMFbdMiKGaF/i9GNVcV5ONFbFZiSnSGqWNFCHl?=
 =?us-ascii?Q?Jsv4B3/YvSbOHSUW0LQOmrHEujzvzgbhXJpQdWDBEKfTf7Y+AcGq4k7o9x04?=
 =?us-ascii?Q?PhTkvXWmz2+KeI92VgyjP091S5gFv8Y9nJnzL3An7yycQI2QFdzYgpbRWhPI?=
 =?us-ascii?Q?THMhW9g0mkIPkKcjL4YgCZXdXLmhRgiXufALaPBS5jOYtC7dqWFFiQbVxL/S?=
 =?us-ascii?Q?U1ncy0SwnWXvz2d3Hyv+cletzUPS1ua8Fm6yZmZs8SsE1FtA5g3jSXD7sbkh?=
 =?us-ascii?Q?gB8BFUkeWQ8QS0d2IId+c3mreV6EsGO1hzsvJyd1Js0pkrDVGJPUY/rRdauJ?=
 =?us-ascii?Q?DaB2Q1LC0ZY43Kuv7Z9Jc4mFG1N50AvUzCCsKfli/v7oCdnmoinj0DMHjmkR?=
 =?us-ascii?Q?42Thy7ojcMIgkWpzkNNDBWxWVymJLXiAa9Z6v/THBLPILa5X44NokJamYRxD?=
 =?us-ascii?Q?EaMklpF6Ub31GMpbfCXD9mCZs3oAIr4QYCS3Mjj0T2rAqfip2w1L18kz3/uj?=
 =?us-ascii?Q?WoDSdnrX81nQ521zyIWCUeoNWH0g2K/jqmvBNcQ9Kvf/Zy48+5OMrfHTWpki?=
 =?us-ascii?Q?rzRlXq3sGhz5vX+wwq5KO03VFYfeR7Qtl9+hhKScXb8jMcVcsIaBoj1AuYJt?=
 =?us-ascii?Q?M+wcQuqJwBuuH+4eZY4SqQE/t3xmKOtMg3g9Cnb1vQ/egl9HhpO7CMLKeuxV?=
 =?us-ascii?Q?XqPiluADcO8vHoSg5vRec7bo3wJ1FQwtnY5D22yP8R3owydnavMrV2zkwKaC?=
 =?us-ascii?Q?qoEzWPF2cw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	J6R3y1BkT07c2nD8BqCIafuJlCYVeFBvgwLEiY7Isb1A0ZDqMsbT66uX2522FLuntaVwEOnFL4N+MU0Y0APkEgNibpUw/Hw6sYPhQj0x7OVEPRhNDqc3YSoFCuNaP/b9wLk7P/xF0vYp7cPolV1XSi6JInIjHa3PRB6zX7wVIajJE/0ATu57NXsPgjDXuAwrRK6sy3DAA5SgRsPCXraoCK1J2K5A/fdz4QlvfU9czWqPuNrQemzLQ6KYVZXWy0319xJSiDp2Khn0iPT53x+Bkp2PNC907NGNTDGxEeoYkfWvekYJ+p9n4QAqVN3EFN6Ov19s4EqZnPDL4Bak0vEOkWX4l5beBmps6kBILZKK0pBbRXJ/+UYiyaHR8JGBTL538PM5yYHU32Su0DSiIADXoKYf6l40fbWlW5zXQf8AmYhtbJXmoEBi+u3Y8/AQaoNLBp04TaT47ZeQSitTcnPX4vtBBhROU7jzCThB+42h6V1MD55oJxb4sXwX6YJPp3V4op+9seq/W2woBO0I7J6lnq1JaKErE2uxOepAiK0HFFjJ+rcaJHptHC6W93i0GA938gFBgYE47nJP+zDVobD4Zu97Vj33rMUOTVMZwVq8c0Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 703cc159-267e-427d-dbd9-08de5a01db9c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 22:01:56.0726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: clrcY/JQyhNxT2ma99XRG3qcHK86tj7DultAzVc9klIQbwuGToU85VCfgl4S7w2vLsPucrFXi1zIfkf0wPALGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6740
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_05,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601220167
X-Proofpoint-ORIG-GUID: j6B7_nwT_ZsNP58JWc4aOHPuXh95L57r
X-Authority-Analysis: v=2.4 cv=IsYTsb/g c=1 sm=1 tr=0 ts=69729e63 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=ue7XmivHplJnLnhbcKEA:9 cc=ntf awl=host:12103
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDE2OCBTYWx0ZWRfX3Q7she73ulcV
 HfpcMRSFJpQZb03bkCvpakeByokuqmtIb1wKBzTGCZylzRZUZYcaou/Xhm8CY7be+LBeZCcKLgd
 p+M8dIHn/erX63zSmyf2HbwKeB402yXOnTa4SYyQ6lWCQTCTp1ngZ6apgT+aZxFBKkQ+ujjY8zN
 +34px7vPy/H6NMlJc2D/92h0/jjS2NCwQhgLJLrYa9wW8XHEjLG0Sdtnnt/V9BtVaJVWv7TpQI9
 HBogGAguxe5Z1UjPA5XrMTSdTEUlOZH9YdREhmWQr3EmXvQgt3AxY4jTBVrzubw5C88vMz7B3RP
 z/+UySfIQgrVINsF/2Ekl0bA1Po6DyPSdAZXcwse4fI+wm0qK9yQgm/qifwj4b9sm0b83bC6fe+
 gHC4FUA9nEsKGmacUb8FqriYADiNoNiSg7SStZxNMJVnfPTOWaIHT3GBp+MC2yZIzdINjITDsp7
 fmQU9CygQ4rHKwSO8qtS1QV7165Gk6MoH/SGW+kc=
X-Proofpoint-GUID: j6B7_nwT_ZsNP58JWc4aOHPuXh95L57r

From: Eugene Loh <eugene.loh@oracle.com>

The run time for this test seems twice as long for aarch64 as for
x86_64.  Further, the run time seems to have jumped significantly from
kernel 5.15 to 6.12 and then again to kernel 6.18.  E.g.,

                  x86_64     aarch64
    5.15          7 secs     18 secs
    6.12         12 secs     33 secs
    6.18         22 secs     54 secs

Looking at a run on the 6.18 aarch64 system, the time is basically
spent in the dtrace_close() call to dt_probe_detach_all(), which does:

    for (prp = ...)
        prp->prov->impl->detach(dtp, prp);

Then, dt_tp_probe_detach() calls dt_tp_detach(), which does:

    close(tpp->fd);

This close() averages over 0.1 secs.  For hundreds of syscall probes,
we get nearly a minute of run time, exceeding the default test timeout.

For the time being, increase the timeout on this test.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/syscall/tst.entry.d | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/test/unittest/syscall/tst.entry.d b/test/unittest/syscall/tst.entry.d
index f2d56150d..dfd7304e5 100644
--- a/test/unittest/syscall/tst.entry.d
+++ b/test/unittest/syscall/tst.entry.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2020, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -8,6 +8,7 @@
 /* @@trigger: syscall-tst-args */
 /* @@trigger-timing: before */
 /* @@runtest-opts: $_pid */
+/* @@timeout: 80 */
 
 /* check that syscall:::entry picks up mmap:entry */
 /* (mmap is called repeatedly by the trigger) */
-- 
2.47.3

