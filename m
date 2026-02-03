Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE5430FC3E
	for <dtrace@lists.linux.dev>; Tue,  3 Feb 2026 22:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770157903; cv=fail; b=jMzhkNT4MgouJdsFJfikiruIk1zrDophar6KwNPoGnnp4taHemIvhW6kBK017qkNCCOjxTsKovKN5ETKHu10+r8zNa3B1FsxVgxzaIT0sVi5lW78Cq6GTdnZiJYt/eK2Sas7EbrLJoFsQYPOP9O5PgZGqV6Lq0r3YOgPzz3ooqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770157903; c=relaxed/simple;
	bh=2UsI/GTUE8iifpKVVsHUM4+Y3l6MPSvIBrPBQ9lRigs=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=BnWWD953rv1incQwGLmYgASmcHI0Ol6hpfT0KzKlGhih6mdc4CqjYIA68VRjoEnRxOOd25kBliTN04gApUNSp7UduQ63yV0qCAPQWUQKCGw5dlbRR+QetO/4GuTI9ZBNtLKMDXk0KjQAkV3YCyx+RWFT1u4k1rENiVdd+a36vbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Y/fVKTKQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XJDeX1HS; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Y/fVKTKQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XJDeX1HS"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IuEOQ1423481
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 22:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=w6Lsn8IBCrYw5JZOQDyr9aLSvD9+vHH3Pbo+AwGwwTQ=; b=
	Y/fVKTKQ3/TRP3bnbdTOiyXZQSzPZAQTNR1H72KUZ1YIln0L1nD7qnrssb94mOWH
	TA4b8oon0Exn3zI5Hf9dObLMihQ8TTpHp1CpsXpBgzGl8gk1+GhuI/FnuVq050cC
	zbBzlV9m6qDDDzcEAugGfd8whwkeqZ6xyzrVOWet18q0zfDv0/Fpuh4pcXOmbNNF
	vPu49Yn4VQxTKwOpyTF2XuddGgcVtEPWSFJPM3W3UljN7t2YS+88UttYHcgCQpOr
	xBr+kACAJyEfbagJHaJVa8KB0qcDX2xQP9v9NbDUhLFZrgUoL/N+AE++SAVlsuXG
	NNrAvylQXf3UsznvTipKkw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c3jsqgv4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 22:31:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 613MNZmn001250
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 22:31:39 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010051.outbound.protection.outlook.com [52.101.46.51])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c186ah4p4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 22:31:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nIFJa7p3hyEUPGB+0vm0vDkQ+sRdZiz3BByqMEKe209m4iIc9712Fpek2dC4tMcHd/XZf734NmKlFU+FYWkAqhrFrEI0o5K9tGquC/yNHVPdBgf759KC50m9iS+Vy6BVxmSilChGl8xxQrSPw8dVVhIYhIL5tE/yzhbCx/nAedYBqpfhMSNvmQsNPbkYCKYYOU2g0C+O3Yr3l3OwNunYmp6rd+jdu+sXX1nnR1/8vbxd2neihOzgEa+tjj5sS9nF+d8HYRyo7pTiuaInA5XZP3PEUpkcRK2kkkR48+uTr4F3xyqXzeiZn9EZNxQ7Xvos+MlglTVJNWcCkU7ckG6umg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6Lsn8IBCrYw5JZOQDyr9aLSvD9+vHH3Pbo+AwGwwTQ=;
 b=Dr/Rm1xtWLa2Bh1lBgav4kg3PLFb4jZ+9Uf0AYU9dm47Ccx7asI/1jSOz/gr9MHv2/6FJg5neaYxVtsBKAAH+fJGOR/WhNHcDqPZQHn69X+RBaoheS/a1wumI3/gArS67UyThW+E7XdEaYnqlbw0nA0/lzxPxW33nwsUVC8cBUAw+VcDV9oHCSLxAjepVFj40IzcwTfK6nxeK/TfWEHpHB4Mt0NI0XFjzsuZk8HYk9/XsaLRFqTROP7EJNzwGZISGwI4RJfe47LreL1p1G/A5VOmSIYOZFcLXGFNW4bSzyv64Ch3/5lqdcHoUNkYSzqYE2bUG5h276XSpv6a5+Cw3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6Lsn8IBCrYw5JZOQDyr9aLSvD9+vHH3Pbo+AwGwwTQ=;
 b=XJDeX1HSRZS3dhjDP6F4M4dBxnrD7vX9eW/7kTlWs3120Vg651k+wQMJffrCXkcIIwgEixMMN35DMeAkQ4QtJKeN0sdYI9gO2MoFhcsPn8g1fHczX90rg+gboqy4sOkPVHwuNMme1/MPwY7FJ0vpcsZTi3W9nqwmRO64a/c7M70=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SJ0PR10MB4704.namprd10.prod.outlook.com (2603:10b6:a03:2db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Tue, 3 Feb
 2026 22:31:36 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 22:31:36 +0000
Date: Tue, 3 Feb 2026 17:31:31 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] usdt, stapsdt: fix arguument handling for multi-location
 probes
Message-ID: <aYJ3Q3oBklx1lGAQ@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BL1PR13CA0261.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::26) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SJ0PR10MB4704:EE_
X-MS-Office365-Filtering-Correlation-Id: 2176df2a-3f27-460d-661e-08de6373fdaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YfzpwnL/pTyjIEkNtw7kuMZglPGQ49ZatP4mEX6fbLBmwUfwrwvwx5Jwujke?=
 =?us-ascii?Q?xL8+PovmVKIwcMbCEZiGeeyLaCYhq+IfpKJxJFku9uYCEcwAp4CM3TYPAhHR?=
 =?us-ascii?Q?eYc3Vc2aOyF5Iw90P2hBYOatZfhI4MLCMDnUe+gEcM4fjDl8NRrNm4MG82m5?=
 =?us-ascii?Q?MDDeJsLLOQpvPS7qAp2Kbb2WWFnuCol1B8PdgRP94AkUF0/L2+6tPKaIGMfz?=
 =?us-ascii?Q?9++6FOh0BYvyMWp7jgnwuN+FXfYlckRtr73SpdUF0Z+jLGjlMjQAc1sM8kY5?=
 =?us-ascii?Q?fu38Tg7eOOmdaiQdy5ZmF8YtoYLyIupHoJ3HdyjYH1oLNin1u80sqlL8OJAM?=
 =?us-ascii?Q?w91E8XNfWj9rTAqn5hDfsF0YESZPPl6wfT0dfR4fsikTrApf0wBu1GDQhp5r?=
 =?us-ascii?Q?Zkg2IcBhZ4UPqPo9nUCdvDi0vx/2RBf3LPD904BdBvlPWWHLccaVaKc2oT8O?=
 =?us-ascii?Q?qnNya8AlJ3CXyCr6WLuw8bjrlYtfVrMQjsBx28X/sx2uof8kBiryrgPuxOAO?=
 =?us-ascii?Q?ClrKiXsqfGdg+MiO1kJ4SbDzf9coY/etuEOnwbkePhiRU3CqsPcOTAEyd0Xv?=
 =?us-ascii?Q?qm+iC9UMcww6HpYq9ch5JRv/QjaH21BXV9lOLyWEkAPah88apI5ydbhvAvZP?=
 =?us-ascii?Q?3DUEKGHOyH8PcVsPxea7gvy8d7JZZ+XWQBuASkKULRx1SMFeiV1ERmPXuoQV?=
 =?us-ascii?Q?K28Z9M9vtl+3pIQsDgvncfba0CC1cijZTYaAUj1oytxQ9gMWS4ggt1yINKzq?=
 =?us-ascii?Q?wlkPPDiV4J+8MfQZrqYgN7ZJUdNIAQT32gAiW+xRsqjhOgpfjCXUj2G1Cs4R?=
 =?us-ascii?Q?iIQctPag90PbVEr8B4IAQ17YgItQxdVdqzt+PGP6GZ/Mu7HoDpF7OyZNnCAe?=
 =?us-ascii?Q?JNFK17f1hBAY7VpYHC9v/vcpfaG3oLzVfszQVmPTtVA/7hiQrJBrUbKViVIr?=
 =?us-ascii?Q?C2VS4ozCDR2pb26b0N/6zGcBEoavTLbmAOD4CB+RFgDu9JoYZ1VzivRURqf/?=
 =?us-ascii?Q?uJjXVboG4gzqtOG7Ou/CFaLNvvcR9HbXFPDOyLmNEoVe7F9OKZFN7l+Ibp3W?=
 =?us-ascii?Q?gr9yJl9oMNheTcxj19l9G1yUD3U2ikUqC6IW2kSShEtKbt49TL1TkbibQi81?=
 =?us-ascii?Q?3FrrW+2O604mJ+p7eTUAUR06hQxLtZk8LnFWKYMzEzzxrTp3QVOfdhrmKN++?=
 =?us-ascii?Q?EdmWBUG5MyBTFcFNQnOdrgrSp4ujn0fkk+VW3H5DVJb5UHvqvkwoOUrgWTly?=
 =?us-ascii?Q?yH+dbejH2UZCpz0aqSnEeEACxwPH/h6EXEeFx55gVaW6kq54uFa7Q65Rh+Jc?=
 =?us-ascii?Q?3Trg5Rf+obX93Etl5PaLskK4Pe4/7IotW9Nh+dPRcgUEbLJnDSDf/rEypHMK?=
 =?us-ascii?Q?vJn/q3bXqBowSP/H0kO9l4V02oFFuWatQxQUCurIW0Ku84og1lm6VGm+8QzF?=
 =?us-ascii?Q?3rjvbIEgsYhLzdMoXXvKQbHHquOwI3Qgan0FG68SqvLHRgVXi3+oU6RFJ5Xz?=
 =?us-ascii?Q?ISFz/Zvy10UK2LohN/7r5OwWgXiBqWwB1YhvZeEd9kLq0wVZDFqDCDBbFZCL?=
 =?us-ascii?Q?G1YES9snBmX9D/q0UGw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8CX/FdQw9jd0EWUd15dmrBMLkXMqYFV+Ut0iYJxhsNYWrzfgYIlFZq6pFbKn?=
 =?us-ascii?Q?1HEGmzYdrV8zFcFOwRF5gQf+llRhgbXSbpWnHzuxAgX8KE53T+nLu8KraAac?=
 =?us-ascii?Q?5RaNKhgfrLn2sd0S39F7M52jdjMwO/t2ir+OMJN5ZOeRER3PFoGK6GTSKBFD?=
 =?us-ascii?Q?Cfw7Q/D9uRb9VtUWyY8TRzcmxd+e0oaKtdPMeYVhqdMd+IVr4mNkqqpfela5?=
 =?us-ascii?Q?BgjBaXpgzbQaGw3N/UhacisVDY2VygUwlRrlxHYXHMnAjfeiatECyJWM4yVK?=
 =?us-ascii?Q?JFPLPUX55mtTJeH/GpvnOo/8Ij2Tag2VhvJ7/Md5xue8/Ak6PuTACOoSwT/v?=
 =?us-ascii?Q?OpeKrOZMRvlXjLcooUSByKvvFBufQKIwlReIx+c+F6tv0BlGLv8esqTb4TO/?=
 =?us-ascii?Q?cmUZ5KeCQJgfciJotyxXo5/gDrJqezLGlfKlJ9MOhxiMGl8frkGHH4PKrEyl?=
 =?us-ascii?Q?d64oyz1kZ0qzsIMB/yIeHbYYziCepULyaUVcTCwdAZGTOfO8JFBGqTbrblwk?=
 =?us-ascii?Q?o82Ogn4mEJDy3os8VDh1+ZvT2qkmTjNLSz903Zp+NgSxr7OMj94OQETLPA/P?=
 =?us-ascii?Q?FGT5r31LfpEp8blcACFqr3nY0fqTFti30MnKQTkMC+7x83sHaAYaZCQKKxBd?=
 =?us-ascii?Q?ruyl8vbhZtpieCgtHthyOsuJv016XM2LotUEZAvahJQQlmmhOK0uL86VzQwL?=
 =?us-ascii?Q?juhe7SUB2J5XciWWP5Cc8u0AAM4RLMbR0//ZmgYErtNbVQwfBeZPCGVnArEv?=
 =?us-ascii?Q?98tM4wWaUnet1f0VL9ZUvJ0IqWwhsxD5hMSrdpJsDJhjhUrgVYTwaj7rhQ2s?=
 =?us-ascii?Q?sMjy/eC9p+cPHTll7ffvP7vR+CPnlysodXw6VczZOiHwwDQAjH94zgL3XJdt?=
 =?us-ascii?Q?8Urf6mKPb9T3HkC5x1JOXHn8ywLgKDvjXeTIOk7D93M+If6fEwYcE/nK6YJh?=
 =?us-ascii?Q?aeG126BxMcfZf/QMYy/az3GjgZ38aytYG/oN4WO/qri/vU4MLhrZl7ycxb42?=
 =?us-ascii?Q?DzOvejaVY51/764sE4V/Zifp86p59FBmr055K1Ai9PfZIwOHYovj2t0l0UFD?=
 =?us-ascii?Q?1NzVYvS3r88lxeoqHzOss2VI/sHDg7KBPayCjPSE4VSb/JRFN1uliBZiKosE?=
 =?us-ascii?Q?i2iASBhMeIOnzb9h4RcM3HSjIO0LkUrgvaKVHct6NbvzJQw0NwncPRRYKQOM?=
 =?us-ascii?Q?0QZpAT0rn3Lyl5wfpGzep2K96f2qQWnnrL2ScxGB2YVr7QStKRvbccaqVMRU?=
 =?us-ascii?Q?ghW6NksUOdKL2bqio0+hh/q1PRMOa/RU4ua5yvYJXtoy4YXXykfXjxfOENp9?=
 =?us-ascii?Q?XskYZNDlwS3wlnmDRS7n8qFyaPx3YrxetlhWM6bNj/eFVd7r3npw2ENT2YVL?=
 =?us-ascii?Q?Ae5mG2M3hM/RNtXTS60acUK/M5i3AdDyqo5t79ozhEyMtpu8fnIfV4ZQ9qPz?=
 =?us-ascii?Q?pzJYnPdkAmtp9M01KaZDaGem15/hKzWVV09mqG+Xri26XhhD3+iRSnnyior6?=
 =?us-ascii?Q?TjNK+z/Cr3mPnYJwZdJz6gKmiIxroNIk5DAFuzLIiXFuTAXBsSRazWiLot76?=
 =?us-ascii?Q?b2YE1iQtJaMtm67kyKVm5XtwrDMeOtk8pS6N5fDVWqxV9wSsqHWhXmupORtq?=
 =?us-ascii?Q?mgA6xt8X4iQebuvMxvCkieQaaSNQz/0tSzpINR1/H4UtEl18m+oYWG2eghGw?=
 =?us-ascii?Q?a2m96SNkfgclauoe1P6VbLpFbhcuCD5/bWTCaVT0cKnA1PjuDDphmVoIdWdM?=
 =?us-ascii?Q?YGIJ45WRv53um8FhNvj0kLQvIzoCI3g=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dSbS9rFdshoeZTYgnVKf9Ule3cAkOtlwvQ9q84PoovUKF71r6TdUBnxWuKkVg/+c+xX4vOKcv8TSBe6oU9Uf6aGnj3ItGnZ9nd8Dqbd4+uDiIuZt4kHpvwsrPjm1q0TC9NQJA3PQFHClZmVqxUxD7m+JNwLfdydQm/wVr2La4h8Lvqbe575JJ7xMAgV2GzOSQa3nHqrT5cLtcLBYqUJiN15cKJZHqNUT2xWz8Pxk8Fdu5K0MuVhIEGpgrXdhm+QXgi6BKbTUuH9uL4ofICPfmDcZ+0scKTu6iyxSAS/SegmgMeO/1u0UAF3kQ0FtETCNIipVluBGbMLxtRRRkvUVu1xn7tNVBKs+nveW6A8//tO9LtkRN5M9SuZpS36w1yuEi9R9Al+v3GhRGKPuFeS+MJUwncn2Qbp/hyYwk+qHZftoA8xntZdtOKyEjrftx/jYsRJtLOq39bx8/zT3QzYZcV4Vs3AM5oocS5n2qWynhDqbxw5h32EfJNSvn24whoeh6b7FkWxImQO5uFoG6KzfCNw/yjcxJBMRnayL2tTiujVgcaRUlMRTGtDjiD1X+GMCI5CWqhVkWqY/3/6fLDxQGunk1Ej2NZ0A+oCCDOzsD60=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2176df2a-3f27-460d-661e-08de6373fdaa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 22:31:36.2480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xV6fuTugm8In0/woDttU1NwfpiCIRzumg1pqM1yT7hAWaZRr+Q2RWhXkY0OM2EE4VSrLnY9s4d3Tdr7KsVOKiaqzBr2HKfbUElbNPVygVwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4704
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_06,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602030177
X-Authority-Analysis: v=2.4 cv=Db0aa/tW c=1 sm=1 tr=0 ts=6982774c cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=03kTC6tBYgzzdIcB37UA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: he7cQOH3Yf6dCyp_byqiNL675JrJLUEC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE3NyBTYWx0ZWRfXwdHdc3untNlE
 4aZ5HB6QBb+uX+vyMWIGEup2g3C3JpJe6IpOa+4d2lEJugu2deICDdBKS2qOSZwTKjqJ3ZEMx6y
 wWMjZ1JvsAaa7gQKwQkFDeEtyJJgF5wOwZ3uhclAd2aenVvD6FTCOnZ3hv9bpCE5ClhAkvBgDVN
 cZuxvoWSbWIQbks3Jcae6jKnS/49GgCFMY+BNPBwLvNGwMu8o+F+XnUrq3jHihv/5ZD1A/outnp
 DWLuJmtRfYe23l07h/ik33uE6EXned0vgSpQSlVLTsapwQbIK9dZo7r8ZN7OiPRVztmemaHfbEN
 uxXvethOdn8Waf1JFHnYW7Ma/6sTVlGklEUCEOgy5ggxnhwL9UKLlK7bzc8jotxxTAP8SxoCxob
 HufXdXiWf93x9TAfDDoVA61namN3yBqom7YMaukM4L6QjtHc9iadUHeZ1ichJSMbXSy4JWMeDMz
 +Udw8+O9bDbdQIJkqPQ==
X-Proofpoint-GUID: he7cQOH3Yf6dCyp_byqiNL675JrJLUEC

When a USDT probe has multiple call sites in the same function, only one
of the probe programs retrieves the argument values correctly.  The
probe argument data is collected for the first underlying probe, and then
skipped for any subsequent underlying probes.

Since it is not guaranteed that the argument description is identical for
all underlying probes (although it is almost always that way), we need to
process the argument description string for each underlying probe.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_pid.c                            |  9 ++-
 libdtrace/dt_prov_uprobe.c                    | 10 +--
 test/unittest/usdt/tst.multiloc.r             |  3 +
 test/unittest/usdt/tst.multiloc.sh            | 67 +++++++++++++++++++
 .../usdt/tst.stapsdt-notes-bug38922360.r      |  3 +
 .../usdt/tst.stapsdt-notes-bug38922360.sh     | 52 ++++++++++++++
 6 files changed, 134 insertions(+), 10 deletions(-)
 create mode 100644 test/unittest/usdt/tst.multiloc.r
 create mode 100755 test/unittest/usdt/tst.multiloc.sh
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 6f93123f..a379a0fe 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -1350,9 +1350,16 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
 		if (strcmp(pdp->prb, "*") != 0 &&
 		    (strlen(pdp->prb) > 0 && strcmp(pdp->prb, prbname) != 0))
 			continue;
-		if (prb + strlen(prb) + 1 < dbuf + doff + nhdr.n_descsz)
+		if (prb + strlen(prb) + 1 < dbuf + doff + nhdr.n_descsz) {
+			char	*p;
+
 			psp.pps_sargv = prb + strlen(prb) + 1;
 
+			for (p = psp.pps_sargv; (p = strchr(p, '@')) != NULL;
+			     p++)
+				psp.pps_nargc++;
+		}
+
 		psp.pps_type = DTPPT_STAPSDT;
 		psp.pps_prv = prvname;
 		psp.pps_mod = mod;
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 6d1c0f65..e575b072 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -1659,15 +1659,7 @@ static int probe_info_stap(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	if (!upp || upp->sargv == NULL)
 		goto done;
 
-	/* First count the arguments. */
-	for (p = upp->sargv; p != NULL; argc++) {
-		p = strchr(p, '@');
-		if (p++ == NULL)
-			break;
-	}
-
-	/* Record number of arguments, and allocate descriptors. */
-	upp->sargc = argc;
+	argc = upp->sargc;
 	if (argc == 0)
 		goto done;
 
diff --git a/test/unittest/usdt/tst.multiloc.r b/test/unittest/usdt/tst.multiloc.r
new file mode 100644
index 00000000..06b0c94d
--- /dev/null
+++ b/test/unittest/usdt/tst.multiloc.r
@@ -0,0 +1,3 @@
+test:main:args main
+test:main:args main
+
diff --git a/test/unittest/usdt/tst.multiloc.sh b/test/unittest/usdt/tst.multiloc.sh
new file mode 100755
index 00000000..aa8ea2e5
--- /dev/null
+++ b/test/unittest/usdt/tst.multiloc.sh
@@ -0,0 +1,67 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# This test covers USDT probes firing from multiple locations in the same
+# function, verifying that argument data is correct.
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CC=/usr/bin/gcc
+CFLAGS="-I${PWD}/test/unittest/usdt"
+
+DIRNAME="$tmpdir/usdt-multiloc.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > test.c <<EOF
+#include <sys/sdt.h>
+
+int
+main(int argc, char **argv)
+{
+	DTRACE_PROBE1(test_prov, args, __func__);
+	DTRACE_PROBE1(test_prov, args, __func__);
+}
+EOF
+
+cat > prov.d <<EOF
+provider test_prov {
+	probe args(char *);
+};
+EOF
+
+${CC} ${CFLAGS} -c test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+$dtrace $dt_flags -G -s prov.d test.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >& 2
+	exit 1
+fi
+${CC} ${LDFLAGS} -o test test.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >& 2
+	exit 1
+fi
+
+$dtrace $dt_flags -c './test arg1val' -qs /dev/stdin <<EOF
+test_prov\$target:::args
+{
+	printf("%s:%s:%s %s\n", probemod, probefunc, probename,
+	       copyinstr(arg0));
+}
+
+EOF
+status=$?
+
+exit $status
diff --git a/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
new file mode 100644
index 00000000..06b0c94d
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
@@ -0,0 +1,3 @@
+test:main:args main
+test:main:args main
+
diff --git a/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh
new file mode 100755
index 00000000..4678a415
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh
@@ -0,0 +1,52 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# This test covers stapsdt probes fired by the STAP_PROBEn macros, verifying
+# that argument data is processed correctly when the same probe is used in
+# multiple locations.
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CC=/usr/bin/gcc
+CFLAGS="-I${PWD}/test/unittest/usdt"
+
+DIRNAME="$tmpdir/usdt-notes-bug38922360.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > test.c <<EOF
+#include <sdt_notes.h>
+
+int
+main(int argc, char **argv)
+{
+	STAP_PROBE1(test_prov, args, __func__);
+	STAP_PROBE1(test_prov, args, __func__);
+}
+EOF
+
+${CC} ${CFLAGS} -o test test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+
+$dtrace -c './test arg1val' -qs /dev/stdin <<EOF
+test_prov\$target:::args
+{
+	printf("%s:%s:%s %s\n", probemod, probefunc, probename,
+	       copyinstr(arg0));
+}
+
+EOF
+status=$?
+
+exit $status
-- 
2.43.7

