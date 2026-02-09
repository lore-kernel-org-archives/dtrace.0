Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139062E62AC
	for <dtrace@lists.linux.dev>; Mon,  9 Feb 2026 20:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770669837; cv=fail; b=hvB6+HGFTuOkT2lbY33i788yhwpUw+m7HLIkdyG1tfwWlAlNF9cU76GrmJZw5fmnvIQh72Uzo+mR0COPz9/VxOCoLxPVPNmpCkny3bWJepyDmWyVjja9D8CI4IuNVTU8k9ddqlE7ilmLjFw/8DJbhbzLR3numJNZZNNmIyP27CQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770669837; c=relaxed/simple;
	bh=4FUX45FOGEnzH9YLjamGjA+FiRymY7V2pnaXin+Btn8=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=DT8QFg/xmeUTU7B/dIQQEnVBxkFj6jtBp+SEBm443ZuuWXwjsNzuvnzazxfpcPSDXaHlKPNs+Xhlm+/5jTiwNTmKbB2lPZatURpoKRHM/QSw1XPaCNICgSi0MnHBQms4LpvWCcDu343qkO00LZMjvMV16ckxuzK6culX2mbf3sw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EED80Ffi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JDz3ad4O; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EED80Ffi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JDz3ad4O"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619EDTSo1559117
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 20:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=7zOwd08sEWtmX3eenhrNHykrJW/gv0sBgMJxiEw1mEo=; b=
	EED80FfiJ6JxYfjHni5OBfhELKzppdUKjnn2T57Ugoc4nLUiEzqfpqX43fOtyYx2
	NPZ4ez20h86ACphEauTDmLx2v5ESnVIzaSaIFMe+VlqT2rAm9hQOniB3w1M3l9JB
	JH/ISu29JsOIDj/AJg/IoaDGxP2g9cagu1dq5LY65dMBHmmaf6+uDre6Gv2QcYpG
	y5OCf2h51xVD4JmNkS80IaaJbNIEupQvkEZR3OatgAzvItc5cumwc8WBb2NWGnbH
	eNx3bhOwUr1+VyKTeiV128NtX18t6WXuOoz5Hl0Le6Fi7HkJvjnEEFC6zjEx/tR/
	b/SoPmmtsML8DXeqm2UOFQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xhuaqnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 20:43:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 619J1qEG000438
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 20:43:54 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012067.outbound.protection.outlook.com [40.107.200.67])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c5uudh8pt-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 20:43:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9bpIFVIEfBm5aETtBgiqRcnqqp2M+mvqKwD9JtH/1nqwP2QG92aF3jQFHwz3uFvsw+dSewNZpwFwnsXOSn4vaJah0+yfFVyj9Myc5fj8Qb+yKIwvBzKZknqlCP5je1OAxJXwfhX57oj0pgWsbghyUGXlpDxwPa7saWoiWMCm64MDkll0W2oPB3q+EIWzNivM5D73JNZ3mmO4u2LiYv7zBgT0zycB8tQXrI/X6q96nlHZ4mor7mh2JpPVDg9iApW8JbxP4Am6+RaTLqkW7+OYYb8GarzKejj51CjzDA+lJoiqrOjBhSWbZ2EBksBGw66lkaLbtLYEfi6U3YvRhYkBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zOwd08sEWtmX3eenhrNHykrJW/gv0sBgMJxiEw1mEo=;
 b=Cz/V4aWD7fW8V1DhTdzjz+M5TmV86R6PfLTwS17EffkHn0JwGYR91Blw/ZLKSQyXSDbK439cQtlvbesB8wQV8eL/15EnDoW72uMheJgS24dr7OFokFvRJa1cO/KnQ2XbRqfTj8s0gxg1pHlcQPpdvDNuaveVw70mOdWvQ2BN0FtxjWP89ohG/NcYxlRxxFHLc7vWtc41E8LfEpdM0dA+jaUA2cHttzwFOpuZbagOwjA5PEQ9tNk1J7Xqlx80tU6QP5n92QLp202z1Cw5cFQK+3Wm/0ntME+DWtuh51tAHSmUAsalybf2XJeyl9j/uAfYrOHhKrAwqLx/6eOITgUloA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zOwd08sEWtmX3eenhrNHykrJW/gv0sBgMJxiEw1mEo=;
 b=JDz3ad4OreIaO9TyfKY9tX9BWz0QVJZCVrWouMecZJ3ctY9tLshVzY7oHKsfpViuUGNyuCn+Tc7aS48w3IlsOelRqTOSRLWVoOGuY+LbHGE+aLsjn7XtFnRFd1/AqWeYnvAW2VPh03XtOIEd4KDzHlYWwNQXAaWh483FFT/2tTI=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CH3PR10MB7356.namprd10.prod.outlook.com (2603:10b6:610:130::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 20:43:51 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 20:43:50 +0000
Date: Mon, 09 Feb 2026 15:43:48 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/3] test: make tst.dash.sh work for position-independent code
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB75221E0927D3E1E80DCE5EDCC265A@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CH3PR10MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: 01a0e0e6-68ef-4f8e-d59f-08de681bee31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o7JPXujkes5+gdIlDKYI3v3NSEDU+RvFmAr/I6Jc1tGqBED1LsDmP3zgfPp2?=
 =?us-ascii?Q?qUEqwseTpViAlToKZmf86t+jvkokKrr9Y6cnDmF12N/+2ZW0cwvrU7fjsBkw?=
 =?us-ascii?Q?Vaopsdsy7iVzi/UFwk0tqdkvb4hTZkVAw8gRIFQVAYDhZxLe3dtiBSPMRKUH?=
 =?us-ascii?Q?eT+05hS7gNwUgXG25gLM+L/fOE1gKRU4mdB6Uv3a5OhAxf+Q7cUfLdkSDvcC?=
 =?us-ascii?Q?ZoEfDcS90VgcEbv7NuCBlsN00wLuRMlDOtFIkkY77gK3bI6+jwxFRjhgMKe8?=
 =?us-ascii?Q?svcmU8J/Wfi5yJUf++ejSZmJzfioUB0tkSqT+8Z09lkh/6C1BlZ1AyEmvbBT?=
 =?us-ascii?Q?H29zkpTU/IzXus5UWvNfw5cMoVls/CmDwnD5E4UOhwt3NOZY3KKfNNqFO7N3?=
 =?us-ascii?Q?8Yul5FYIvrFsE6p6Ep8nYtI5LYPM33ZNlhazjBCyMQdwoxAyvizc8zv8UXRA?=
 =?us-ascii?Q?FQDgENLwKRGNVNbxPkJCViLPAVgCbykiZKnwVBc9126BqhYqtUDWzc8WLmzo?=
 =?us-ascii?Q?zUTz5MbNhNXiH3gHoMmz2sTafQy+syFZ//xPITZgmo9AYUFDZLTPswyYWDdL?=
 =?us-ascii?Q?SxHMBcY3F5f5yvHOv/kp2JoKiR085yb8i6mz8yQwIGstquUJ5cAEg+mcjidi?=
 =?us-ascii?Q?mIBnmQvLMa3xGxefaSKhyhabUF3lPZhgYj6d9PlqtHZ2YOVNazH/pZeBn+nO?=
 =?us-ascii?Q?wSyhgOuZSmEakvh3Dlkn5q8CVXQbQN0dL1JoSIDvfLU3mhuMR8mXENsDcojb?=
 =?us-ascii?Q?cyMaXHGhgrMaH02HpfUu+OP3aWW4hEGbfrz7FBCxuo4Jf8Rt3IBlnsk1A9Ix?=
 =?us-ascii?Q?Z0iZilVTe5xQwfzN6VWgdOLofGCd/txkgMHggPSOx+BPboaw2LUCzQgO4EZY?=
 =?us-ascii?Q?XHfiUcfO5A2bHVwavb/P3r5D0LDcPsmov4nbDgq0WloxL0g2aEwwLhjU27RX?=
 =?us-ascii?Q?So8MZcAI7mznF6nZs1IpSBLGRcQt5FYfc+YA0mM7ZD2WYTYLUWju9Oef9T/O?=
 =?us-ascii?Q?/lZNERcWpsD2RsmgFv8e0Kij4q2t3aXWgbu1nqtW9nQfhuy7l5BTNmFd+zys?=
 =?us-ascii?Q?bRRg0FSRMjEC+fLTu4exobOza3KAcTB5FW91qfAZ1tVPQPczptHq9m1or/ZY?=
 =?us-ascii?Q?q34kuxeHc6sHrv7GdUqORlBR5NePHOTd7dgnfz/UUJzVZSgDXuMIn0cSXHux?=
 =?us-ascii?Q?/3QnCjI8Pv4OcGI7lGjPQyMIge7wbYzJkrTYtcdmM3j0weqqO9q9+aMUZL2/?=
 =?us-ascii?Q?ZSm+7Ar9um3sWSVNHNr2fd2SPZldhmjsTwHG7HttVigFy5ZF/hrd7nN608Qx?=
 =?us-ascii?Q?2AUQM20U69gpHieeTZoSBzl7DRRzMsP9UlwQtznuhKMmAIcHqZJErMJUOYJ3?=
 =?us-ascii?Q?1hzEhgOz/ygJhwxJ2kyxqZofIPwzWaLKBeMqj7GN2IdE8hf/7Ko7U+cwGahE?=
 =?us-ascii?Q?GgAuCBO1gNtQuuXc8lQy8MdkVzGL1CifSfYWB5A1gW+cXKgj0ZnJXpwEC5rG?=
 =?us-ascii?Q?Y0eB0tE1u1rXFmC6M6WpQi5VJbJohYrENj+XL4X72a0E1RYsEu324ZpAhdGG?=
 =?us-ascii?Q?jQR0RAWeXexAy6Ktq4A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J1p97d9xGZbEB2ixOgWLiDLM5yraAenqG6WRQpcjh0q4Dzfy8fTiGBPc3nx1?=
 =?us-ascii?Q?poJe2nqo7jZOpzt+iN8cf5rPAUhksWt4QKtw1ojg7vLmutYS11efXg/in0mn?=
 =?us-ascii?Q?JmOE7iUnzp6aq81lymdp5Wj+D4K1Mf4xv7GuzueuiAnt6PrVBxBRu74IyJb4?=
 =?us-ascii?Q?2FiVVFPpI/7AVu9eJZYRVzht52CmAQhapUIGPOvv8NQEuL1bkqOQ0rY+IEp4?=
 =?us-ascii?Q?FX6nU+1ghB2031htkvnRABmmPM4zMiG5rP+4AWppBoWaaYGHuhBCG852ms/+?=
 =?us-ascii?Q?r/wTTDIg9lBxi4BLBdyTQ2vg3okoAKIj+2fYC6Gv9IqwoB+X9PjDqvnsfDwc?=
 =?us-ascii?Q?Yj6nHPO/DgOiSaOf92tOhs6ExM2ZFZZ/yYyxWWvy8DjnBb8tfvV/Pr8LE7hQ?=
 =?us-ascii?Q?sqrrt8ue083Ca9QfKdv9MdOKfbA50xbH7WnzNpbEbrgHx20RZRisGq3J8Rnr?=
 =?us-ascii?Q?5sH1UpjbVFBQHpHB5qjMYONRc1vgog7sOinDocPWDlJf1fh+sWCWNFiL/yhO?=
 =?us-ascii?Q?CQ7fqkUVJnGQRKviB9D1ZAIfqzrKk6n4ycBg89NrP+OrxNDA1K5ShKGJPovg?=
 =?us-ascii?Q?G5bGRt2Ttjc3prartLnuvQm9Ifv7VFFlbuR5Yb4BC4KsRT+2Zd/dNIgQV21V?=
 =?us-ascii?Q?NmSOOd14uvTeGIcF3naQkq0Lsg21wci4Hs9di7GeQuQQqb/yBokQfMI8luPx?=
 =?us-ascii?Q?i1vwkVPecDw6P8y8BweaJ1KCsjTCcWKtt2LWUEJ60YQ0s1yu/CCkSGkq2CCt?=
 =?us-ascii?Q?cKw9Cc0OEMWNhayunvroiNsCgo2h6HGdPwH5Igq57mL2ZdM/Kk4MD982eALZ?=
 =?us-ascii?Q?4j+ED1xqXiipsB80damYS/TpB/sy2HedkueElgfcw+WrnTK5aQJAqwpZGZUD?=
 =?us-ascii?Q?neZgE+QHBOfb598CBqrPhUHW3Dg3yBbeXoIEaVkj2ZTZRHSIvC7dzy1NHQ7l?=
 =?us-ascii?Q?4wS0uXVChlH9fcjC8lS1yaZWprXZBHN+OTzPAxfdzUSZ22rpnEX0tKv8wh/q?=
 =?us-ascii?Q?3Rrt+yLxc/CtKrydOKuhGNxmQIZKHR/7c1+XvtzmcWigKeCmb3El6Jfl0wND?=
 =?us-ascii?Q?wQl4dLbR+1scb9X21hMsMC8WXyWeTEbZyjPuQz0PlN6l9IOw2zqzoV9PuXfu?=
 =?us-ascii?Q?CGwvpkNjLjH+NnELqclLs8NA/HQsru2II8gzJS4EmnMw1TQX/gHBUAdGtRjV?=
 =?us-ascii?Q?hgx61DalB+O/9Op9d91WcGKhy65jHmslwEcEatiuKXng5lhhoWY69KeJPUXl?=
 =?us-ascii?Q?Kg1bxOf33bU0UabKw2TnF31sqU7RCYJD0JS6GipYBD4SwPwXDfR658xNHEiU?=
 =?us-ascii?Q?waU3xLFsqq7+xcVC8LwdvPhUe4dVor/oea5CfYQ2W1MrVr+DRcp2f0J9Rqy9?=
 =?us-ascii?Q?USC0TeyZ+xvM/N+YH7Mcg5FnfAYp98niHxpJKHBYBZgipOqsh9HIvkofCwb1?=
 =?us-ascii?Q?YAJlRGXj/ErX6UQasmisyZA+GcB68sQwkISBdrEkY5UfsNF790Ads0Vt7ob4?=
 =?us-ascii?Q?vlANLa1jDxoZ2YJZEJjPvIlpRxhraNRaOxI90ODEV+i+iO59vnC6+zygyakj?=
 =?us-ascii?Q?v5thtRuS/xQZ1Ro48QCcrdsh/aT/vJ+mwzOYtIUMJt2oEZQXkYiCWofBzoiz?=
 =?us-ascii?Q?5rtbq4cozn3gvdv6cMyVCGKBDXMWdU5oqx4blYYzCXoy9Ma8Qn6VK2ulGlKB?=
 =?us-ascii?Q?ljqbIfHVx/fi0LERUAuJOPhm6uEywpkcMKRQi/FL4t7uG9ITDq47UXWwZVkZ?=
 =?us-ascii?Q?sGldo0MxSA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MaTVod5ccpjkqM3booESyp4uhbeZXOtMcYDtyM3sqGL9ZfJJet4GTgVTHUdAeCqJD4XarVR2L2McwXpbDDz0EikkUaHCjeGiDK4YSBPpFqsH5RuUUVY7Fy618dZwNNC2YoYpQN71juAQ0StaOM5exJ/rQISXrCkhBGdFdQ1AZVpsYHAuEEzlQdHX8bjtxE7fZ1qTbUtHhu9HPFgv1ueqLIUHHiOMg3wrVA5f4rY+TwrHwJ+gHMP9VxboZJEF5OOQHMV+E4kgXDrMct/M5Y4Vzx0Ox1HwLLsxiig/+uOSenLBGIzA8KTGh2JE/kDvOy3AISnWkYK2CFXdmj9NeZAhj1+ptGm5enG8WVuKlumE9BTF1vhTWKgZ+IFJv7QIMxUkjIyGFmDS1YVhJpfjcTkxyi9MBXxoTMqyxi655bcUVSGd9qh5zW8xRMyiLA9/CCkMxep4tRKQ/PYnOJL3kPzreBoBi9i7wh+24wB7fSOMXolMOM5FdUJVwPfBAPdG3bjSQYNBvxXSOLbDtvGK0bdEw2/hhC9AqesSA/ockqB3Ik9pjMr5P4r3+L0HamLWRyDBmMl/lMRMinT7X0mA9K9qKst29MLSmZ6EPRcX+w71/DI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a0e0e6-68ef-4f8e-d59f-08de681bee31
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 20:43:50.4244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UIs/mTNOSS3nvKpVbVWdB8MMXmYMeVjjAdf4PcYRl5vfejJH5seCNAW/x+ugE3pfFj9KVcKsHkM2l1Dzl670rj9+gkkuqwc2Hi49pZsQipk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7356
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602090175
X-Proofpoint-GUID: jxB-3c8FafSFZus5qaPJwUb5CtIM7Amd
X-Authority-Analysis: v=2.4 cv=FIsWBuos c=1 sm=1 tr=0 ts=698a470b b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=SmdXomQA-oisg2Mp4qEA:9 cc=ntf
 awl=host:12148
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE3NCBTYWx0ZWRfX5fYBIsxNWcsw
 KBIaex0JGTvn10qTg9wQWk3p3EbxbQtzm7Ljw6yLIFgtwbKCVSD7OHizrxb7rUG9mThjtF9Z9CD
 0Gn740ZG6IAYY5CRPPztEUeQ6OeoFsNemROmqoLwrF3M9YKungc/SYmCCcs3F1MTBGJBhZdQG/j
 HbuDDC/3Pza76fWQrXz7dEvkyNevuKI0jPQ2nQHhEXwPuPe/3i6t7jz1bVOObva11GAaaUlUkk0
 OoaiZY3UaBHb4UPae4wJCMwi2ownAxIpejmbR6YvEMhCRGOYQu98faXQfiGCo5V+j64p+s7xNSy
 gK3NKhbT67C9x8OmjE79Tf2lKpjFNpA5o+ijWV1Ta94wi2NaWNY1Tia4wtsFViq7sVWr+rAxZ3M
 /dSQKIXQpf/UCDzkB8NtqSyHUyNc0k2+Zy76ybcM0c1vRhltBEqTiDhd2LZYpCnAcYeiDFqUdhg
 qnPPvBvVFigywgTOr+GJ7jmd1rhILGjwouliQats=
X-Proofpoint-ORIG-GUID: jxB-3c8FafSFZus5qaPJwUb5CtIM7Amd

When code is compiled as position-independent code, the logic for
comparing the reported PC at probe firing needs to adjust for the
fact that the reported addresses are absolute whereas the addresses
obtained from the executable are relative to the mapping base

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/pid/tst.dash.sh | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/test/unittest/pid/tst.dash.sh b/test/unittest/pid/tst.dash.sh
index 0289b609..d793e081 100755
--- a/test/unittest/pid/tst.dash.sh
+++ b/test/unittest/pid/tst.dash.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2025, 2026, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -16,6 +16,8 @@ cd $DIRNAME
 # Make trigger program.
 
 cat << EOF > main.c
+#include <stdio.h>
+
 int foo0(int i) {
     int j, k;
 
@@ -46,6 +48,10 @@ int foo2(int i) {
 int main(int c, char **v) {
     int i = 0;
 
+    printf("foo0 %p\n"
+	   "foo1 %p\n"
+	   "foo2 %p\n"
+	   "main %p\n", &foo0, &foo1, &foo2, &main);
     i = foo0(i) ^ i;
     i = foo1(i) ^ i;
     i = foo2(i) ^ i;
@@ -85,8 +91,8 @@ for func in foo0 foo1 foo2 main; do
 	  }'`
 
 	# Write the expected output to the compare file.
-	echo got $ABS $func:$REL >> dtrace.exp
-	echo got $ABS "-":$ABS   >> dtrace.exp
+#	echo got $ABS $func:$REL >> dtrace.exp
+#	echo got $ABS "-":$ABS   >> dtrace.exp
 
 	# Write the actual dtrace output to the output file.
 	# Specify the pid probe with both relative and absolute
@@ -95,12 +101,18 @@ for func in foo0 foo1 foo2 main; do
 		$dtrace -c ./a.out -o dtrace.out -qn '
 		    pid$target:a.out:'$probe'
 		    { printf("got %x %s:%s", uregs[R_PC], probefunc,
-							  probename); }'
+							  probename); }' > addrs
 		if [ $? -ne 0 ]; then
 			echo ERROR: dtrace
 			cat dtrace.out
 			exit 1
 		fi
+
+		awk -vfn="$func" -vrel="$REL" -vprobe="$probe" \
+		    '$1 == fn {
+			addr = strtonum($2) + int(rel);
+			printf "got %x %s\n", addr, probe;
+		     }' addrs >> dtrace.exp
 	done
 done
 
-- 
2.51.0

