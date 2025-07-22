Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090F02E371F
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 22:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753222375; cv=fail; b=Zw9rZXWjcoJC8DUz7jPaRJttlz9AozSuu89SfLngO5nuCWixr28KAKRaDNLqdVEHgmE5Aq4+XqS0r7nLUXAIcD0PGO/dnGLoHlaAcnTfW4caJnOOPBpg2wj3rwZnNsosxh2XJuxazE+xJbxZWWnU0xgeavRLOy3p6RY+/nvWLUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753222375; c=relaxed/simple;
	bh=MQQVfBPHJsO8ClXm8UgjSGglKU3uArhDlfmBJPxB7lo=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=UxX6Wm8J7bOCsK5msS1B1RQKDUenYOQVEjTsx4yrokow/ZdEGwZXJKop9s1+fSH0LHu2XXq9eVkKaoiOsrWS9tghm4/boW87KUXiXO2WYDHsa2kjjDkDqQh5ur2xaSmzAC29ZYUo4Cjr8UxTH+hvFe/7mW69Vh4WcHANObTXZXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LrbmLYie; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lPce5q9u; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LrbmLYie";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lPce5q9u"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MLDesU024050
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 22:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=xy3y3dtc0PLKjHpXiGxsFfW5D3U9QCv4S6HH2Mxv3aM=; b=
	LrbmLYieZrcuA6SYU3oMX+dU6YaaBGiBzLZfzjyqIy0eZ2Gyk4Gt/8IAOqBMgqsx
	mU0uPBppUImAEB/MS8P2WogfCX2NZhpCGsiTsBmoT+Vb8uSU03uPKmmJr8zfMNCM
	u4UkrA2SEtseXs6V8wzd9+4tX0aq4j60lTFmELUp2V6L8EVdrd+Mtl0y3htDHu9h
	KAnFSTybsSnFSjhZ66EwolO198h8AEZp4ziB5WSKiH9IDyf4pYXZ/9GYHTs5+SmJ
	SlGINRR7cau9o/l/N6ve208n5RxZPJSevPb22XjMfNcs+FpxLEaz8oXMUOcJzUUN
	RgJMfBbb8Jp4hBIgFSYOBA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48056eebx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 22:12:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56MKq6GQ005811
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 22:12:51 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t9vfx4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 22:12:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nzlgixe5Oeph9vGjJowwXGXUU2kVMArl5KHZsH23S+E+MY9QmFYlMcvVptunVplw2idGudifZWI2ndGN4NA0swTGgq0KdNPvonwYDxN2lEjUGIa6fZDOd7YRj6ooSwglpuLj9vRTMl7ReeFA61qJWp+JQllML4jd7HW5wbd0QMlIpRM9uYIsM3AGWW4ZRwK2XGNqc4TmSAJ0PbX1LsSE2ix9ImgvJusGNkejCT4ZSZ4n1cZDwCnQ5TZlpvfDMiwF6vOKVirqj4XE69jO9jI06dbbuhdTT1eLgpQBFTqD+XZS4MhtunnoWe2CqL8FvdPd0RWWIwSQLNisf7066dfKlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xy3y3dtc0PLKjHpXiGxsFfW5D3U9QCv4S6HH2Mxv3aM=;
 b=NQ2fcdPKbqY1BgfINpHeY9ll2QLMDBGni3LJ72CAGJ9MMdKpuI8B4kpULDcishqL8RUQS8dUGO+u4sbVOzCAkSKthiiTDjUKk9VE9w0NOqS4WFXJ1Vlo16Ixu8CKSpeRePzxXiUn62KJpLOrIyjdFHo2ewnq/A4/2UyDjo4p2MJTG6vegP9lRsBSZpoPITXqSOgaxNXtMBVgGsDcuu4Yvqn5sl4vF02pa+mjDVKy4H7nzOnosyMsidSCBGxPkocZF/jwlYPOl/d82HcDWR+N5TJGSOI/qOvv2G7zNMu5kr5mJFKNtAazqhgfdw45hpg7hcNHw51Rkrnin8Dc3Si32g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xy3y3dtc0PLKjHpXiGxsFfW5D3U9QCv4S6HH2Mxv3aM=;
 b=lPce5q9u/MchVjbeuvDlpwSvugEjMvV1sXeQ8t82uInnaphmZNSDsUZ8mKO7GLO3ol35IRJSds3urgtbsZAMYXJmAGA334UBCiYC1tX47gsnM2MPtc4gFl9resZahFNMy+sSLiJdnB0u8pW6/lnHTr6jGNNpV/A737fEfZ/FBwM=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH8PR10MB6528.namprd10.prod.outlook.com (2603:10b6:510:228::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 22:12:48 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Tue, 22 Jul 2025
 22:12:48 +0000
Date: Tue, 22 Jul 2025 18:12:47 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] lexer: support // comments
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:36e::29) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56728D6097EC38EDA2B06306C25CA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH8PR10MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea34e91-714d-47f4-5576-08ddc96ce484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yCxbLgnALbgac+rZyNMOKgj8xE3ucW8i82AdvDsxKmafTbOLnV2c2AXO6qv/?=
 =?us-ascii?Q?anc8VKvaXQ/XCSv2mutT5fHWS0kB1YrGcvIo5SBH9Mctea18CQtLtLLCXfQb?=
 =?us-ascii?Q?W/+qZs402RgVeUUqizSN7LmMlV9mUVLYy1dYuK8oMJU+f2c4pOFF6V3yJAXg?=
 =?us-ascii?Q?2Pv3M5mEYGuhr0H3G/rXcfDtNooatCCe1yh2c/armBbMrCh/VvWyYnZdM0yZ?=
 =?us-ascii?Q?dTI+JskOw5w/9mTHWSm5FryaPEZ8WUYi6RvUrlQtaUB0Ph25h8I2GyB8cazq?=
 =?us-ascii?Q?nBA6Wf17WWSGK3l4Fb3/jJz/UHerJ1D4DbSlSjzduiPBqjogFbicKbwOrZw8?=
 =?us-ascii?Q?kLefzKoHny+1CHGRZktCWnYSXd0kKsGhXhoXhlrJ92Ca2tMRUEOSRVZtEFcj?=
 =?us-ascii?Q?QA3kQA3dUbvt+0hOm/NPMsx9Ntv2dfBFNXgq6DBaUwd6kckU0DzNHMkvKh7z?=
 =?us-ascii?Q?mZRhC3V2Q9G0kKbVb5Fn/fZiUS9tpO3bIsi4tzBdzaj+SP4ejji3aX4P/np7?=
 =?us-ascii?Q?16MJV7Bgv4jl9frrsthn92iLawAHYZVOYXp1OqK1TPe64NVw9IOgZwnmonX6?=
 =?us-ascii?Q?Iqow1K9566eh04y4wVMsBsZJdLqpY/IawyXYFlg5/hhFEIfW4/tmm4PzmnqU?=
 =?us-ascii?Q?kGbNXq0V9kbUcoJc+bhySik6+CWcQO5WA8xdkKD1NnWpLM+wJROGtQDm9l3M?=
 =?us-ascii?Q?uhe9tXv9/nczUuphiw+ecLEZq6yHX6XdvsEFwJpyheQ5QZyQ464V54LO5H9N?=
 =?us-ascii?Q?ftTdFzSOyZlukQd2jBaxIE0M7cYXQA5oue+xFoSe94i4VxVLYjb21TCmXrGd?=
 =?us-ascii?Q?ddBIC+M2tzgESi1dPnsh+0l4FdpqOXRXu6O+AqbBjf3abxwaEslaCACqbYJd?=
 =?us-ascii?Q?lKEGKBdnaX5q3JPPxWQ0PCzxLlZdc0vKFxpvjANasbE5+gcFa0BzROY+1/Vh?=
 =?us-ascii?Q?sr3jgMhXParh556hMDKNQGMAEaEfY3J20GIfKkrPBwuiscHSz3lNYZ2lN8MS?=
 =?us-ascii?Q?p6Kea0YJ9bKmMbckX5NL5f8292KSwa5G8NCmFNDA94ULUYToExxGW/gGjbBG?=
 =?us-ascii?Q?5//s6a3GUIFe9EPSLiVsWxkTiBaYBaNHlagRy/DPnNsDdxz8PcL+tQ741Rt4?=
 =?us-ascii?Q?Xm1f1nDYOvNzwunViPby5T13e0M1eWoQAUFtlJj31Niw5Y7gHFMtrzsQMicE?=
 =?us-ascii?Q?w1RqXhTuLQcOHI6CbNR7VJzT2x75xpe1N7E0bGqi4V8kZeAxCycq8Gsch9yN?=
 =?us-ascii?Q?87xR4GdJYB0nEnehI0I3QUqtX+OLu/Lb4HwzhUGIBTzl0Ei9mC+jzG4SKlO+?=
 =?us-ascii?Q?LKx5YFisoVTHo5dPfL6+Bp155uYVcJdENJuzdPjPOhnaVtdxUrA2+RiF8zos?=
 =?us-ascii?Q?WJ43Kya+HFX3RxduVdhkvIZo/m0KGy8f3DpoHvORIu4x/zFFcJQPmmG+dSJM?=
 =?us-ascii?Q?iTL/ZPN/FeM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R2mJtJcNOxdNoozLbmxE0k2c/j8QV1MRYJzbla7jX18elIvY9Gv8BV/I0NC+?=
 =?us-ascii?Q?YEq4LOzSsrBPA2Oxs/W8ZbflhfW/ivlcI31eB7ZqvIVZdQAKl+ALsEjm/ARG?=
 =?us-ascii?Q?qDsicOoccLG/mGAgvjqiGfK5vV4duKi2e7sZPGPjAvg7IT7gjCo68YS8O2wt?=
 =?us-ascii?Q?7GoWaVfuD2v1LjDZzwYGwN5OaKTnxXRaHRV/obGBykJoI3oNbZGl8DWZ1x7l?=
 =?us-ascii?Q?gFxpPOTLjBd6Ul5SyK8CCp78kAla6apAWfJ/Lnb9AjOLbiEmWO6EA6cSg65o?=
 =?us-ascii?Q?kocLh+M/EyNxkrNbDi2pbB0r0Dodgpt5STAFNK8H5AhGDOQXfXMwWsq13QZZ?=
 =?us-ascii?Q?/PrZBl0dddgMciOZol8RCapOK/boYFTj820Tl65kihiorIFUjczgyXVI65u1?=
 =?us-ascii?Q?q2aUiowiW3tLa1nfB4eVvmIMfweXI2axocsTaIoKCvdGhs1RxvowGST60VHf?=
 =?us-ascii?Q?yvrTxDgiRs1Rr24Ejc9ISG3ExjK2jgaWW4hZQhksYo5WYT9bhMuS3xs/a95M?=
 =?us-ascii?Q?UDUp5TBX0iKkWOoeVhRPuSI94eWg1ESpH0IdNcZ4JmkrXGxjZ2zqMFcXXGMC?=
 =?us-ascii?Q?gfeCZjLiOs9971gDaXMpk+f7V62jEe4LMvGU+Y7UbFhyw2b6GMS6630vPgjw?=
 =?us-ascii?Q?jZkuKbxNHTxFaXV7veR8JTZaZKRd1bWOpmmdZYywf4SlTF12Jxb9FG404jz9?=
 =?us-ascii?Q?TbGM84k1bOyIzAOljNA4iEFKjYPpkfkadhFHQR16r86lKM4hVHLRyQ6mWLwf?=
 =?us-ascii?Q?FU6zCfEJ72ZSM8VPG9FhRYjMqB9bJT+xdoYDRF5UKpCVUzZknxRji7EIGUGb?=
 =?us-ascii?Q?K7yqvnknZhO6U1VQE6RlGLFNaJbVVTGhB+TG7ixfbIlGq0Cc+DVqvSsD/ck8?=
 =?us-ascii?Q?viJSPV9CBEPghy02Yp9Kzm5u32dZP+GtuwRdU6dI/AYsPhgknlQEsJqxc2uA?=
 =?us-ascii?Q?5LGJ3xyEIrPXdmIAvlEVBo5y3/NBNLl2JasbzDKW0E5NAm5sSJhKRdbAw9GK?=
 =?us-ascii?Q?NsBvkW9sf1DDt0to0z3eQYFqijpcAOP/9NniI4vqZ2ClZ0X8OR+sBLKni80a?=
 =?us-ascii?Q?DsbI+GWxiB7SakNEeF7gzt1ZzUFBKF45MyzuMLD7/kM1rJIRZYaur8p9lwVz?=
 =?us-ascii?Q?wGesTm7QbpDYHlROksTewbQPNRqM8aMjv1oUDYVt9lbnkZICNrRHKnx8CuRQ?=
 =?us-ascii?Q?h5oxdrXSObEDheTUNgdcNyWQG57+QMk6FHwaTBpf5a83V4TxH+PHH3npndHb?=
 =?us-ascii?Q?n6bSiEoox/ejxDdUhHz/cznZOTvJ3yqYC1snW6zE1XehkkUwkb/s1cywpmJ1?=
 =?us-ascii?Q?py0z8Oub7Cn4M6AHnIgO7pNgJigimpZeq8x2QUy2NDmolW/50uXc6PCmTFhu?=
 =?us-ascii?Q?q/xKaH7LhbhxFJUluWUGUVrNDEQIOVLCZqZ1PJG9bl6EhhV2zXV0JRa2ueTc?=
 =?us-ascii?Q?27l1Qoih2lGFDc3TK5wAOhYkPgGoXvYGSClRpOTo23tuCRSFv8oxCXECAlro?=
 =?us-ascii?Q?P4xt3MASqAFiaC8XAnqKpP3nLfGxC3jW23j/QrdEeuKETedqcQTirEqiubyP?=
 =?us-ascii?Q?fYIKHIwYQM8eGYHRcuLK1KvroRxYcRFDASQqaXSGixuFi5hCkXUY/jwgogBz?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PalgWTUBgdx6QJKrGkKRbKDIxAJkt8qyOEMsiGBqq+R3Y2glYIYBesHMBJqb3qjwqkglSu3AKcF1rm/jupU2p+a0tXMnCJmPxMRzvDdvo5V1F0u7HtvhqjUgo9Gfr0NbHkUixe2CFVGmJDe0AF5atvZ45qBxFAJi8m5nEBC8ckkpcoul8ZpntZIDPgOrEaHXkcQ5TmxBjsW4hDYGa/qJfbHywA8iSTg9MQqDUXmD4t4NoU/jQFQ5vBceT2U3/XQ17Bsp+momO5oibxzscJEjmO22Oi0fCs2Udyp9eYU6RbAAdrI7KgFPjZm2MvB/FdzxMuV/UAp/jsi/2taSA6miOX7/XrZPMThnLqV8y9WkDY1DqYAbwpyuhtJla08g3UfTpUKBBHFQV7X6lvU1Hx0yDtt8lBVWzeOJOmeVJ4FfDoK964ZzAHNtVZZxgjzr+QWmNmjbwLH06rsYvTnmcKE7dzBs4AdTr8WahJBBpZZd58fNuoou3m0Gcy2LvsK324an0S4up4cNILhlr5Xaa6rWUkS/snVv0YefOiOay8kaiRhVZ2Rdfg1bYaBLo7LcRmdaqmACD13sD11mpkaw0n0tR8kLJ4H8xAl2TX36oPQ8VoQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea34e91-714d-47f4-5576-08ddc96ce484
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 22:12:48.5375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGhNKG8LY+JEbTuwnOfY4TXh2B2aW/0pLRqsUv90QpOcWC0sMH4Fn35sz4fiZn3NFgZkYkfKNUUWNG3giHkb69EHE6b/CcjaZ+S/XpBr55w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6528
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_03,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507220192
X-Proofpoint-ORIG-GUID: GORqoMYts6UZ93jdmybBPCvadzQfmb8f
X-Proofpoint-GUID: GORqoMYts6UZ93jdmybBPCvadzQfmb8f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE5MiBTYWx0ZWRfXyNmlWukO0LWP
 l3Eh7QTN9PyAT3bwJNFVKlQzlFuQQEMFqFejxWDFS2EUMDfX8TjBsSP4bXuO1N3EETnDflJEF64
 GMO5NMWLPYmaUhEDFyUwMep6Mk/KYRzyCviBm+kcDSE1WLgcrDotT7abM5ETMdNS7vgh8n8vunX
 Rsn0Fr5Ckhla0B8bp82vEH7i44vct06o9oVOiM1SYEDM1LRtV/6TtNsvwcGXIpf+w/6d/ARBpQ9
 TCVGftEeOfKLkFw/8xD+t+IsM++gssGdnuSn9hJY0HPNQVO7ALGDAarY3aDwz61gxYPRSWwpvDh
 JyshX4fn0LvbN/02eSIpAF2+vEzFpNWhBCdCtdQR/AAot++NtKTFxygNStnqAlCrXG26wBujjU9
 vCQjFkHzRVInMS9JvkQYQbyMQO7szGU/n3pIETAQTxZpNwnY14p1Us1f7OjHrQRWEf/kEX2n
X-Authority-Analysis: v=2.4 cv=Ef3IQOmC c=1 sm=1 tr=0 ts=68800ce4 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=Ro_bmro_ZlDC7okrwUIA:9

Suggested-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
Suggested-by: Alan Maguire <alan.maguire@oracle.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_lex.l                               | 14 +++++++++++++-
 .../lexer/err.D_SYNTAX.boc-in-line-comment.d     | 16 ++++++++++++++++
 .../lexer/err.D_SYNTAX.boc-in-line-comment.r     |  2 ++
 .../lexer/err.D_SYNTAX.eoc-in-line-comment.d     | 16 ++++++++++++++++
 .../lexer/err.D_SYNTAX.eoc-in-line-comment.r     |  2 ++
 .../lexer/err.D_SYNTAX.eof-in-line-comment.d     | 16 ++++++++++++++++
 .../lexer/err.D_SYNTAX.eof-in-line-comment.r     |  2 ++
 .../lexer/err.D_SYNTAX.lc-in-line-comment.d      | 16 ++++++++++++++++
 .../lexer/err.D_SYNTAX.lc-in-line-comment.r      |  2 ++
 test/unittest/lexer/tst.line-comment.d           | 16 ++++++++++++++++
 test/unittest/lexer/tst.line-comment.r           |  5 +++++
 11 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.r
 create mode 100644 test/unittest/lexer/tst.line-comment.d
 create mode 100644 test/unittest/lexer/tst.line-comment.r

diff --git a/libdtrace/dt_lex.l b/libdtrace/dt_lex.l
index 9d502912..a7234800 100644
--- a/libdtrace/dt_lex.l
+++ b/libdtrace/dt_lex.l
@@ -35,6 +35,7 @@ int yydebug;
  * S2 - D program outer scope (probe specifiers and declarations)
  * S3 - D control line parsing (i.e. after ^# is seen but before \n)
  * S4 - D control line scan (locate control directives only and invoke S3)
+ * S5 - D line comments (i.e. skip everything until end of line)
  * SIDENT - identifiers and comments only (after -> and .).  (We switch to
  *          SIDENT only from state S0: changing this would require new code
  *          to track the state to switch back to.)
@@ -46,7 +47,7 @@ int yydebug;
 %n 600		/* maximum states */
 %option yylineno
 
-%s S0 S1 S2 S3 S4 SIDENT
+%s S0 S1 S2 S3 S4 S5 SIDENT
 
 RGX_AGG		"@"[a-zA-Z_][0-9a-zA-Z_]*
 RGX_PSPEC	[-$:a-zA-Z_.?*\\\[\]!][-$:0-9a-zA-Z_.`?*\\\[\]!]*
@@ -408,6 +409,11 @@ if (yypcb->pcb_token != 0) {
 			BEGIN(S1);
 		}
 
+<S0,S2,SIDENT>"//"	{
+			yypcb->pcb_cstate = (YYSTATE);
+			BEGIN(S5);
+		}
+
 <S0>^{RGX_INTERP} |
 <S2>^{RGX_INTERP} ;	/* discard any #! lines */
 
@@ -548,6 +554,12 @@ if (yypcb->pcb_token != 0) {
 <S1>.|\n	; /* discard */
 <S1><<EOF>>	yyerror("end-of-file encountered before matching */\n");
 
+<S1>"/*"	yyerror("/* encountered inside a line comment\n");
+<S1>"*/"	yyerror("*/ encountered inside a line comment\n");
+<S1>"//"	yyerror("/*/encountered inside a line comment\n");
+<S5>\n		BEGIN(yypcb->pcb_cstate);
+<S5>.		; /* discard */
+
 <S2>{RGX_PSPEC}	{
 			/*
 			 * S2 has an ambiguity because RGX_PSPEC includes '*'
diff --git a/test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.d b/test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.d
new file mode 100644
index 00000000..61f5961f
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Line comments cannot contain begin-of-comment markers.
+ */
+
+// Comment /*
+BEGIN
+{
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.r b/test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.r
new file mode 100644
index 00000000..74d1d0ef
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.d: [D_SYNTAX] line 12: /* encountered inside a line comment
diff --git a/test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.d b/test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.d
new file mode 100644
index 00000000..8fe2ff04
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Line comments cannot contain end-of-comment markers.
+ */
+
+// Comment */
+BEGIN
+{
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.r b/test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.r
new file mode 100644
index 00000000..64d5ae63
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.d: [D_SYNTAX] line 12: */ encountered inside a line comment
diff --git a/test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.d b/test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.d
new file mode 100644
index 00000000..a9207693
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: End-of-file in a line comment is an error.
+ */
+
+BEGIN
+{
+	exit(0);
+}
+// Comment
\ No newline at end of file
diff --git a/test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.r b/test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.r
new file mode 100644
index 00000000..f46fce3e
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.d: [D_SYNTAX] line 16: end-of-file encountered in line comment
diff --git a/test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.d b/test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.d
new file mode 100644
index 00000000..0332e1ae
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Line comments cannot contain a line commens marker.
+ */
+
+// Comment //
+BEGIN
+{
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.r b/test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.r
new file mode 100644
index 00000000..d1152afc
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.d: [D_SYNTAX] line 12: // encountered inside a line comment
diff --git a/test/unittest/lexer/tst.line-comment.d b/test/unittest/lexer/tst.line-comment.d
new file mode 100644
index 00000000..4deb66f4
--- /dev/null
+++ b/test/unittest/lexer/tst.line-comment.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: // comments are supported.
+ */
+
+// exit(1);
+BEGIN // exit(1);
+{ // exit(1);
+	exit(0); // exit(1);
+} // exit(1);
diff --git a/test/unittest/lexer/tst.line-comment.r b/test/unittest/lexer/tst.line-comment.r
new file mode 100644
index 00000000..d4e4c325
--- /dev/null
+++ b/test/unittest/lexer/tst.line-comment.r
@@ -0,0 +1,5 @@
+                   FUNCTION:NAME
+                          :BEGIN 
+
+-- @@stderr --
+dtrace: script 'test/unittest/lexer/tst.line-comment.d' matched 1 probe
-- 
2.45.2

