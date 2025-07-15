Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2874B946A
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 04:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752554302; cv=fail; b=QMOoOOn4MRy/IaIvOuA7/o1Q19UAsBGDxcDCv2hMCKdpJ9CKICU3fwmYzK753NSQAZ7WnpxXzJnaCH0qPGFXmfxtStfQzGlhw9J+fn0NXwedf0FaKDV96QpicK9jO8wbP583sLakKvQdCuS0wDTrtpwGLGf8j9neppqdnqATf4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752554302; c=relaxed/simple;
	bh=ZXzJ53HSp5/hYFwywzxd5N2Dbjfb9oMZEs3Q/rCGEoA=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=mXxJuifYEzwtH34uZCM5YdHGrsWfxGSnrss9FIw2c9/1i0dAX+GtAgHXazOZNyIjhsLvVCZPnJUFaI/2C+BQtTay9FhENPf3Xj/qfpy6TlQywVZRxDur3fxGu05TaEnPJZbouqtEJVTkI3blh9jAm17wLUWwerGe6arnpJoQmIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZAAciAmM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WKtgFFm9; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZAAciAmM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WKtgFFm9"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F1YniF027893
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 04:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=wMWMt3l7dMvsIMbyEq3qk17vGQ7Q7e0IpcW/vKQ9HWg=; b=
	ZAAciAmMJ4r6mz4+hSDfMwFGP9lsl2rEagsNnRmflle+5m36lb4czRgHdEFBh3+S
	DBB2DSuNodGqJ/7FumqkBmhv9fn2ottzmh1gsOo5+slOLJ3Io+MUQoF2Q4dL5BnD
	qrhwjFxdbd3MjYjhPHCercptXLtdU3cpTM2s42R2deCIz99FgR2x6gEwuu1ClE1U
	YP3czKgkhlDOtLrV3MV+nlHkKJrzguqBIGDuRXuRSHtK8sWz1aOc3Yr4/zPQW6M8
	IOIpYaZydbJ5AIMVwANnXl1XXbLv29GkgR1LkVv0FA1TqJEeXmmjb0sbmxWfHtdL
	swPT0g/uCrs2AAIRQ1plIQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uhjf66y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 04:38:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56F1bBgV011624
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 04:38:19 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue59e9vq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 04:38:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GX9LJmOewEPKn3UYOjZCxNZhewF8tQX1/QhWH3T6RDXEbhESk5/DDkKzRETbi2iAu1f6b0Y/K0qLkpna1Ir0JytwjIuDSZkDWunoo/n7Utler5aE5QnOCzTiD0sFTQOeuLDRtMLHWXKI6iK+WfW3NZEET+ehP0ZxgZi7tQckBdbhicybKwhNlbN9xuF6cQ4hsrcV0LKDGlxxSRGvkwlE2pvk15+22Cab051oAfQrEXTfv+BDoORRK/u6vQiBTdtkVdWjg+bNp9PCoykthtZMOcu7hU7Jz5PdJ3i4T1HwWPx/GOWcy99inpXwmeoAThU89mo7rMa/i3Wgrft/UCaaCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMWMt3l7dMvsIMbyEq3qk17vGQ7Q7e0IpcW/vKQ9HWg=;
 b=qdDiuWgDirQS/zlsw6MGSgwezX/BDH8IzFuPcqhx/HBQPiCcoUEi0gN9DkUFRNyXJL4K9ZgYRaOtql5LLflyIZqWOXjzfoALibtrYAvSOVIzRpZIKKhDUjlLm/jO0ooNog+na8J1mnX6E31/Gqx2870ej8aylm93hazDBvo56qH77yHmDu8SwUEIL0BlzoPgCLfdgYuNKFEqJho0QYt4e4q34MJrXLSqwv5BHjbk+1F/B1niN0AggGAgBDma7qwmptmVREgd3q0sZvmc3vyjU5Il563iFiElY8dd3VF2P4HE9n3+xR3J2gCEgFkN3prMNPJIi7hGNLp7EJ7XGwYBDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMWMt3l7dMvsIMbyEq3qk17vGQ7Q7e0IpcW/vKQ9HWg=;
 b=WKtgFFm9IKLHoawef4QBGf1bd0SdFyCTZwF4eF2xAkSeEFyyszOC2eQnwsBeydwnaJGl/ZOe+88vdckkmJh2tJhWuX1VCK5rTGty21F9DL1hcJ2YpHpxaIsS6HraM9ojG4uyoVoq773TKHKTVtb0oxW51OisvtVRjMBn42bLvME=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DM3PPF2FC05F2F4.namprd10.prod.outlook.com (2603:10b6:f:fc00::c16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 15 Jul
 2025 04:38:16 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Tue, 15 Jul 2025
 04:38:16 +0000
Date: Tue, 15 Jul 2025 00:38:14 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] spec: ensure the include/dtrace hierarchy is included in
 dtrace-devel
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56728CBA3250F59A56757E98C257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DM3PPF2FC05F2F4:EE_
X-MS-Office365-Filtering-Correlation-Id: f7ba08b5-54f9-4114-4607-08ddc3596a80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?evV5puZoB+WGmgIyXQamI8JZW7Ocv495WPI16mTo6HG0DAcZclUBxauP2/gi?=
 =?us-ascii?Q?1/pAHxiPu5Xui6UbWl7Y3N3y9ArM9yiIjyjjo82trDfbY8AdSm+ZqMe8e6R/?=
 =?us-ascii?Q?He1ZQ/DK6A+WyBsw5Z3btUYL+F2+dwi8Q0Lnqv7ooV34g71rrJBXO6WKkdLm?=
 =?us-ascii?Q?aawQF6cwdzC6JBhwAkZGhxtjcca/oa54sdspF2lNTnPqvEOqw3LpfEO3Al5k?=
 =?us-ascii?Q?yVZPLn//D2uoUgJydC6WwEolYtkGT8w+ge+wXSVsYmsa1TbRMfJtWl4/MPEd?=
 =?us-ascii?Q?f8MOjtVJ0T2NhfUkfXuDOwP6SPlz8FAWbrXie+718XEiHdXjCk44RYmRdEN4?=
 =?us-ascii?Q?OHtqKzhgkQfg0QirW5ohmLpnG9Wf+cRlryP2cfa6M5cWrtpE9gTx5Qg3uJCg?=
 =?us-ascii?Q?SofWbbQC+b99ufD5pt4V1viqnbaNuTdJGSLvYdg42FWAU6A6R/IJieiULs4d?=
 =?us-ascii?Q?agjkNGC00JQwMR/tluEemfHGn/p0GizL/7OCCk/U+FAUnk2jyxRXQHnuEK/r?=
 =?us-ascii?Q?xCNgU2Z2g+gnIePVzfB7T2Mzd8sdm8eYkEkOEwrG/n14iVb0Gpiu2bD8O2lr?=
 =?us-ascii?Q?3dP+lJ9NYXgEcbPwkHGxKs/sTzLFkvG7lUL7dMkYXLGHhbYGOpp2VVVC6s1z?=
 =?us-ascii?Q?kf2eCxgMcqwvy3pfHHNHn72L8oMZPSUS4Tf8z6hXGhthQh8pYWfDFUskRgXA?=
 =?us-ascii?Q?CfgCio2976VmnUr0qrRI4B/EFZBeuvcjzolDwF8ih45/LeS7cNvuvAj4MJAP?=
 =?us-ascii?Q?OIwMzCGgIfnU5arsKD6CAS3cpj9/5xmKgJ+1cK+00w30XBO/thiOXZBt9Jcx?=
 =?us-ascii?Q?WXwBAWWlwk+CMOHW42+CQ0ca0uoVs7qv5twV/AULvYhTj/+17UbfmXG2IVTo?=
 =?us-ascii?Q?zGrQ9RycRF5ePN0CuH0SFbLBp4E5T9Lw2f71BRj8iKtb0YNlcEZf6e0eNXdn?=
 =?us-ascii?Q?Y8KQUTzwEH42nMCC9JVW2TwjoeNcgawz+DYyuSU2kVtfmO5J+B3Zjk3TSp1s?=
 =?us-ascii?Q?6eNDWIuzQDY/+kdRA9MOjiZZVWpc4Z7pLfKXsR3UqkM0SYMhWweD7UOuTWhc?=
 =?us-ascii?Q?JS7CeB/sM+iqKnYO6KqedPwqb1O8efy3qjQH6PPUMZQMUYDZL3yCXmXOlACN?=
 =?us-ascii?Q?1wEAZRhONd9ruBo3zS/SEbeeMFqEMYakfG7L5akd3JAqtMvDmWzKUMhpAwE5?=
 =?us-ascii?Q?FTX0YMrXn55jlX4AHo9LifdQyIea+uJEOAoE9odBFZUSwJ3/HyJiE0CA2m23?=
 =?us-ascii?Q?VwR29zu/nW59vMw2x7ORG/fjYRbjrxxMRc4au4NeObgduXHfZECAzeDEJvt0?=
 =?us-ascii?Q?1rr3nNUb94cTgmRMHK4i2jOsj9XuGQtKMQWcmve0NPLUfZ4TK04j77bqSxcb?=
 =?us-ascii?Q?wejJ4YlaoodSI04sNBHeFuA2580+8i36tLqfXgkk2Jb8F6BtCFHyUbjd8y9l?=
 =?us-ascii?Q?5+gH99NhpIs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K5XfAcKkYhYoZBEKHvFUJXOjeHZVsYkBLULczkPsOMDtOtKKdAEx9HvpN0nv?=
 =?us-ascii?Q?M4t7iHV4sKqUjz7e1aY6bAJIGpHtBi9EAgtpDrfOHNhmFrvKQyUeHrj22XKR?=
 =?us-ascii?Q?02lba7DzN67RkAncE4gPfSJcw/hcDMh+2nOzBhw6NcuF+BBFHRe3Kbw8VWVP?=
 =?us-ascii?Q?9haYa3Jd0E1+TXC6DROLvtxXo8lH7MqG14f3E2O7bRyKsc3gtZAJDYX4vqs2?=
 =?us-ascii?Q?8XVjoxtepXAipBv5hBCm4Zo3GU+ocCvHj8NylIoHy617IFB5M2026/GUYNCg?=
 =?us-ascii?Q?wHi60LsljEjT3nHeDdyTHc7rVyvtJcr2WvwCsKvMstaJ/bSNZfQXKzMEPEJV?=
 =?us-ascii?Q?k+6DPku1N15S5NU0h+vOCm23OH9idyOmEJ8e9YVeHg4+yFNxvkmfEQMY3lJH?=
 =?us-ascii?Q?eFTbSPzcsZVQUiPY9mmwCs/IW9XQYhi1XBeyYnrSgVfPNyPa3xNK8Evh+g2Q?=
 =?us-ascii?Q?VUx5Grg5fMlEK8IXXgzPiI12tINtZqRIk1q11aOt//tM9h3EnSbEh1x85jKW?=
 =?us-ascii?Q?Fk6UXS59kfgCQr/skF3iM8qnltTTYdEWLYGeOYCPgA0oNnvwjek2Q00j+Dsa?=
 =?us-ascii?Q?zW8dUatPl1KJrRDpD/D80voESR2u3eAkGaoyJVKI4WjLn8cgWdWtxUWVU7uR?=
 =?us-ascii?Q?SLBjgaKx87dNL3LMhFCUhcnZCAWC6oRpeUZ4/NYtrAajqyBpHoPerM/3fuOk?=
 =?us-ascii?Q?EzX9J4kyp5WuXL1BGOtsW0pKeoS/YmiSv6xMRiY24iFwELpvQdxANaNuPtTM?=
 =?us-ascii?Q?p62S5C9DRUD6WNPABlMZKK9spd7IFtbBHJOL4wwktkbtCMDdK7PQafCIvd5Z?=
 =?us-ascii?Q?DlHEhYgZCDhacLeN2HlZSt/LPtB0GniRJONZDeg3YPK1qLK6ciYrLhaCg/iC?=
 =?us-ascii?Q?FaNn+2i7jPGf8X55UfEkX2OeYyZ9AHI13LVAJxHBB1YYQ0ldink3B2F3tYWP?=
 =?us-ascii?Q?E0LDYFdD35P/isrm4a+wPVetQgciFuTRDL/WRm3Pow/b1Dxxi7Y3LK+L0wG5?=
 =?us-ascii?Q?5Qgn8kUuXYNJcp1zYi/ykW9WfFi/G2y69u+bF0jCGWT+BaMS9rEofqSqse/P?=
 =?us-ascii?Q?251EdV2Rn7LZRjlTN3y7IUKY6fYitWwbHRjvRLVIXL3AHuUYsnqAOghiqkXn?=
 =?us-ascii?Q?YDbaswxbNHMfU3CNRMuCZa/Yfmp6DCAhdy2SDwrOcCLnW4jJY7wt96WAPRlV?=
 =?us-ascii?Q?rK1gRY4G9dYGxt7owqs4EcHGVqDhnytBeXtVc7Q8FUi5slnDXQ3/n5vK4r6s?=
 =?us-ascii?Q?XZSbU0Hl/LmkjVyYu4zJR863/WqzGe+40BUWTO5nhYl2Wz3svcP2M7Ixe3b6?=
 =?us-ascii?Q?Ux+nsn9rECOj4dBbn5G5XgrrhvPhTZ6meTMm9uR2JcR8tu/d1zRe6GdC7pmr?=
 =?us-ascii?Q?hYVu2dbRjflSJgiDeFNT1YPu9RBaQ2/4xFgeCQJUBdr98Mcm5fB0wmlN0Zvb?=
 =?us-ascii?Q?Ge0fW0C6R2m1F/kyKhN3EArHiKC/I0DEON0swNuuzovb4RxA6vfNL8PnD5Pr?=
 =?us-ascii?Q?4rL84kGT7Fs9mUPtuLUyWyf32RA3obI2eJHjiCPX4MOa2OClgA8CMP4go+1Z?=
 =?us-ascii?Q?cVz79rS9rIkYxBaLezyWzZ4+LDdk20CODEIsaHFyiU/kgHljVJg2Q83+fnsv?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	w/sdbBUVFOdgoTsuc2ERldKtQrPU9Hz28DSV2Wfe5fvnvroxh5mRucBuz9pOXxOWVPdYgIE0MxAcgXH89EzU3n6vSl6iRAEtk26VOugzKqijJbB077NamcY3nhpXGZK0Gvwg3RemrK8qz6v3HzPosgoyapHBC1toKoNje4Yg5TJkck3MHk5nJtJGdHm1CNRry8XcAGGNpqsEivW9hhMw+qIeSv0ugPYFhD154ClcuRscOAOd5UIsDPxi59Su8xy3GgV/temM2rg8nap951jwdU34XMkJKYmlgBdeGK9Kqyj1OAJj3Qfj7tY65XlNhMOgLV0HGbJpkZrXb899T2cC/s15EH/7dRbTziSc7SC5oaGckcRWLB/IBzss+V2fFNNnX5lBLqoULTNsYxAk1aLzwnv8xv4ZGrIxi20Vdud3SqLYD6RvU2As/Rk0xG94ZcuzsQuCi+0EtAwY/Xm0o8gHAFOau9JF9V9iuEZF8VUa5aVE0z4uEdMHyu8Oa23AM2sdxeyGBz/KeOk8476axToGCSZndSdWiG6ubzQOPLnTU7xUMN+xMpQL6TrG0Ad3SG1aoDhUeBkF8oMN1E0FN5nzZebfzOkV0ZCf7diMPye58RM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ba08b5-54f9-4114-4607-08ddc3596a80
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 04:38:16.3432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLeD2iuMuao/4ujVV+q8I4HQnx/aRQLvYuS71MtHNWVOYMM66L3TpQPTG3fBTNx5cFvycXu1bt4837fp92F46vYhlyuQLPkVrbFFmuT9Ans=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF2FC05F2F4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150038
X-Proofpoint-GUID: itIzb7H-MKr2oEKUPFGGnTvlNJym95ds
X-Authority-Analysis: v=2.4 cv=O6g5vA9W c=1 sm=1 tr=0 ts=6875db3b b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=VEKvLYm3Yz3dMPn7FAoA:9 cc=ntf awl=host:12062
X-Proofpoint-ORIG-GUID: itIzb7H-MKr2oEKUPFGGnTvlNJym95ds
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAzOSBTYWx0ZWRfX0xt66vtC+sC9 dqYNsan88P8y76Wypru6IWJo2d51jNsBreUVR7SPSTHkmIkwjZJnW4vgpuj2OYiQxlnLeLdFRAm hlQSasqtxXIeplPSkcmsfhUltTbGm9fcaEAWMPwwnJimCkbvzI2rXzOM1v7XhSDwgkV2U6hGymg
 QqKqRCMj1vy0t2sYVPeybK+n86+tEVFlQB+wDgi8uqCMmiKKV2UmMB2Xo8TaJ16laADfyyF0J3M bXqNtW1hrDt/CUrRvu3RT9beqA7MhSCnHwAeyRjIzn9fFdAzEk1KW+q1IVYtlP4fQaUgd/C+RTO JS3v6sku4eb/1NzE69DMQZVMVbyXtbsgB/boLfC7aCmPdozrKAnxrI41QJg4PJcf2jjd76SSI5H
 9zCfXnQf3Rxe+daKkJ/FKtT4nt5e9os7OAo9eQ9/AWoemS1cD1K1BjVPu5SUusEauWydnxr8

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtrace.spec | 1 +
 1 file changed, 1 insertion(+)

diff --git a/dtrace.spec b/dtrace.spec
index 6bb792ac..115cea60 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -220,6 +220,7 @@ systemctl start dtprobed || :
 %files devel
 %defattr(-,root,root,-)
 %{_libdir}/libdtrace.so
+%{_includedir}/dtrace
 %{_includedir}/dtrace.h
 %{_includedir}/sys/dtrace.h
 %{_includedir}/sys/dtrace_types.h
-- 
2.43.5

