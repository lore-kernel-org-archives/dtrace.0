Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5125C1422A2
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 12:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718800910; cv=fail; b=uDLkrXGdk8fRoX6mliRKCv6bf7nFsQAUS5sSWtyjrw7ai3EUPdkPjuTnV8Azlk39mIa2w3SrBI9arKE/hetX1ctITXRHPdhMy92WTOCLAmte9NgFd9uYGW/E0QSjdb2uSTS33J4nJIojVnxR/KNGESu21LgLIUZMGsgdQjGGfxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718800910; c=relaxed/simple;
	bh=XSf5YyeUV4ExutZ6VyfOFP7b2bgkJ4Qp7RYb/Fcb3vc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=kcuHLB+wStRYujuNMLZqdbWVofpbrt3ZjvpB691KdKvORUBQMy/nLne/+z3OpK3Q9ybPLbVC6fpgtizISGHJ3jAvkGw1aHuubPqzt7ChhV0VMnNLZBbTTM63GSKiYHBDS9N9lkd5Z+WvO9xQC8tqstiOyjz0/Lb/GW1/w6D6THI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cemRuNfv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LQivMpTf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cemRuNfv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LQivMpTf"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J1usaO011313
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 12:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:references:date:in-reply-to:message-id
	:content-type:mime-version; s=corp-2023-11-20; bh=8S8iT9hT3VEJ0F
	L/ARbPpuRKLKHMebem7LMDhK2EM4w=; b=cemRuNfvp91Ay+yvtR4Uu8Xe/CuXOW
	4MpdBtnSLFDcxaQkaYHjvxvidzj0kYenNHfI+DNxsZvG1tqDhrUysHsdBz1pxgb4
	cP4apM7T3ytVZsJTMQd5K4Syb6XQYGzajQR+4pRfclLMv6DluKTWBHAc48rp2sFN
	mwH/FbKnaHsiDmDKHUYKGXDFU5+RGIOqW1eI0k66L5Ej6bUOa1Kd9feVPTjRM6Jg
	ZQR/4HMO+mZKv4BM1BA+QIK5QcIBm+GiE0PA9LYXZa2qNHkzyhzQCjAmt543wrVw
	3fxeMuTg4UqIBYdFKbh0cAKMi0mkQ4Z9bqQNDymqHmOiOuWkyz2U/jiQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yuja0h66h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 12:41:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45JC8txl007006
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 12:41:45 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ytp8fu9q2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 12:41:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nnp0G8oW0YdXcj8+BcDPZQ7NduEJBEOICyHypuplCWkm64H6V2dLYRshtxHgedXe1U/anI/P5X1xifjMZA8JDXFLrCK9ENzmSySFto21I/J26B3EB36BB8z97BjKVaY6aVgr4fh4wjAdWzxIaOl+bBnuBst74pUWI1jWs3m4ENbouAC0N4w8deKwDm/jkz4EuNWIC5ZYrQ6tC750daO+PIKDopD284yoJIkFEkRNnJU8Vg2mRc1BKhLb8S1G8rO2ahE5zycGEUIeIT9eBoVbmLjNvmbR0MYziHuAt9A0b2RfQ2+MCRWm+fqTOSaBafyWk721rfo28it26/TB5ikguw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8S8iT9hT3VEJ0FL/ARbPpuRKLKHMebem7LMDhK2EM4w=;
 b=PV5c2UP6PwfwTu7Pn90TzWAtb1PU9RnMpwUd/OQ8j+WGEKGtE9fW6bLGQqHTGM8lRr4ct9Ftj3VySqtGdc7jRpGVzt0InesmBiQ87KfGzsWylv8FyhuhDv7cLoXzk3b79HXJ4es3FiuVo8/PO9vanqhLDnKB2QyTzG/I9BhwBVL8GG2ul825PMKLObe3tttTwZ0r3lfG6ArUjZoRhCISavVAyDx0FKDW6pce4h0duFMY+IeEMuxZkuF/gjf/Wiyr1ea6tQ2GWbNo91nUxfI2823/xTpk04lp65Mbh8UcKG453m7QO0L3QSwUHIT7HWrrKAkGGsHobbFZLftknYk3Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8S8iT9hT3VEJ0FL/ARbPpuRKLKHMebem7LMDhK2EM4w=;
 b=LQivMpTfv0JSTOBDWKrlPm8hEBxrxhVDU1pqvmsV9tug2XXu0P2AfWSOU9KO5a0mSLSm5WX3VLm5Krha1JUCvXF/1mshayRZX0vFvmzlbJF3zAIaRd+X3Nhq8amT0ch9XMJUEp5qVh7m3dtprBYp4sn6WlFTc/Ngb1EKwJBSwGg=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by CO6PR10MB5585.namprd10.prod.outlook.com (2603:10b6:303:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 12:41:43 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7698.017; Wed, 19 Jun 2024
 12:41:43 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 1/2] translators: support 6.10
References: <20240607184155.316904-1-nick.alcock@oracle.com>
	<ZnJRYDRrlwAsNRr7@oracle.com>
Emacs: a real time environment for simulating molasses-based life forms.
Date: Wed, 19 Jun 2024 13:41:40 +0100
In-Reply-To: <ZnJRYDRrlwAsNRr7@oracle.com> (Kris Van Hees's message of "Tue,
	18 Jun 2024 23:32:48 -0400")
Message-ID: <87iky5ayuz.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0316.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::15) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|CO6PR10MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee5e373-837d-4847-3d8c-08dc905d2cbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lJde78vLjMolhZbz9djsR2IHyGYDK/YG4q9ORfCJSE1AzlyW7G//t8bY/xJu?=
 =?us-ascii?Q?WY+VQU5UcVK0O6WYrj+sHBkfzfO2e+SLd6tlx6tljuIJZMr0KVASPZQKkhkw?=
 =?us-ascii?Q?sdfxbvE+BMmfo844zOPg4AEGvo1Nhl54o7nU/NuqCESYEj/g+goFJhZYTkKG?=
 =?us-ascii?Q?TnXYwDT2nMyhdSzErIBiIQx4dRhGf2EJS44X0jh1to671N/RA0YFnSBDs540?=
 =?us-ascii?Q?2mKhl9UzvdvJNl2uLHyy/ryl90wCSLRY3+2lGWSUPcfXmJZzIYR3WVbzImRu?=
 =?us-ascii?Q?d2DpFTF/WSt2JkM6bOmOUVoWsjjTtOSthyBn7tlOwhV7D+QZm9Z66Uw8Wf1j?=
 =?us-ascii?Q?iuSN9mpg72L/Yi31zZEg3spogG7AB5tlMnzYwL/5aouIl6Eg3xcJKuTLGpB0?=
 =?us-ascii?Q?wZS7f7om8ClwnwUHl2WVLcDd8Q07MNbbSqe4n51xP7/ioZpI0HdoeSHVlmJp?=
 =?us-ascii?Q?yWD8iHcRebXkXTNXZuif6//L/L66EKSnJ0LgcO/ddoNtEf/sxwMj0k8cCeFf?=
 =?us-ascii?Q?QXrCjkd3nTpLUgcet95cw+Bykmto5oYZ3mm/NDDQ/Rdtx0pempidxdjeJxBc?=
 =?us-ascii?Q?qtg7KQRx13oukIQuWPv3wkib1VVw0pmmIWPkx5gvzmUjwpew9o0hE+v/j7oj?=
 =?us-ascii?Q?yEw4M/Q3F0g5y84G/K4jkMBuFUHhPXUErlH+D35x9oCAMbO3nLbc+2VhmAXP?=
 =?us-ascii?Q?xGRHDKpJf+4R/FHuvvGN3lv3bLj1xvrMgy0YKgvWoZavlmp0HIJK2Eb82t4y?=
 =?us-ascii?Q?Tj4j8fWQetYxJ47heRp2E9L0deifcuwauEexkeAVyF73kVpuKbVzTtXg8Ip5?=
 =?us-ascii?Q?81TPt9qSnhfkZ32iWWfjIgtJbc+NfX4w2C+Lcy/kDHEOa/WwEA9Gr7xrlG/Q?=
 =?us-ascii?Q?dE4iLvknVzFyAIlTTO8cgGJai8Za4fBgOYuERFyqkb9HCKKVs0MGneEA9RlM?=
 =?us-ascii?Q?KDieDxKrDZn9rNaDG/NyVEjtfXjRzYh8Cpm97t+aXBg44UQWK2xm+qdkYeJE?=
 =?us-ascii?Q?USMuY2CMje/BtfZgwEmXqkVw1DHa9Mg0znfFM5KVVIpAg/1GRakOyMV5Xaw8?=
 =?us-ascii?Q?Otv9TbRCJPO+lcAdwK5O1OaCO8hOEYTH+UffEBJChh38LUOZKCfVQGUP6bOJ?=
 =?us-ascii?Q?3MvncfzypB8uTS4wvwqFf1NplUN2Qw3hl6N3kmrNDzDvQWZkHkuYwZbK7vUU?=
 =?us-ascii?Q?2+i05esO/XDXur+GVgLxaVYp1ebMGTef09OKLbif7fZQAWDRTErk1pZV/1Qj?=
 =?us-ascii?Q?zHUH8RyHLOf+14IKct/m?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?op17iln9wc09lTqQtoT5K+uCksTuB3DtV5BNc/JRO+n0gw31gRV4DDxYme5a?=
 =?us-ascii?Q?GuckedYYgXAZBsBSau9BspgIk/MWOoTCzmIpnGxX4Z34ctqzCmlPM+Z5Sj7F?=
 =?us-ascii?Q?O86AdBP3d5yFpuRxv8H9WBbm5nz/mgGIF86xiVUyi78OTLKB9hDBM+gpqXJl?=
 =?us-ascii?Q?alsf/uZNkCAxVtn+lpvmUYo4Ty0ii//PxyOwTFkxMu5cpxF/8Jf4enVGRzY4?=
 =?us-ascii?Q?JUOA6YKveKlNzOoV0W8LFv7MWZNveTIsgrb4CJSbSi8UQ9CmeeMrhhp9wz5b?=
 =?us-ascii?Q?8RKPrvBHwC9xSpSEqJqIbAWdUku6UfER/+MIEp/b2iMrIvUzdxmJcurYuq8H?=
 =?us-ascii?Q?swadn9okppU+jsKgzBzkWc2XoaVjekUrE74cI8bbzSnacbNGiCzTWtCSuQmF?=
 =?us-ascii?Q?D2fpU3F7KnFyTgMSMql9weX4JWWhIl++tRqzEmqwag/0/p6WOSwDxSpvl6Gh?=
 =?us-ascii?Q?v1cxfWXbjCBFj4L6pmPcbjmjDa5uGMNP8Us8XNpd2ltpuQIXw7kjcEvzCvZe?=
 =?us-ascii?Q?4kkXPeJ9dYldyZHqd2jmIlBntD2NP4LEjcfu8ZgW99z6jfkUwOD+ckivIyYv?=
 =?us-ascii?Q?TDQz+D5K0x9VTwIbY/FLQXeGOdOywr3DzMcpnysQKYfEZ0LYxLLdR96vC2Cd?=
 =?us-ascii?Q?JTJN59dFaWXKlSFuYv4Qp4fSQFZo2By2ZF84fNhD/ykVzvb/dGlhILeWxT2u?=
 =?us-ascii?Q?VKS4mnYzNi1zKciJVKUvvBTKy7ENCkwjw+Dq5Pa+0BK42obvx4LL9Zo6Gy5R?=
 =?us-ascii?Q?TawMnl9lh8RqgQTZPmxGbOor37LryNrGhyD2my2x0b81KzsT39yW2GuLjvT0?=
 =?us-ascii?Q?Gbcr5xQWew5jxKfbdtZketf64EDxcATBx39EQv9n2R4O5qq0+VhNEffcVvZS?=
 =?us-ascii?Q?aMapC+jtJfEauohQjb7oGDzThJF6qXRtlWNKopYRLqViwPYgsTLMHGFubVBk?=
 =?us-ascii?Q?oZB7WrZhG/Ja6mfMbYrR6kW6/6BLk9DJTyNPrnJUwD3AQruzULrdWkj1x9xc?=
 =?us-ascii?Q?B4mwU84iNTfus7MPUc6lyiURcWVeWqMdpAFipnkpQ0eTa7i5ElyhxVZiAHXB?=
 =?us-ascii?Q?nmcwLz6faLsHOpbaOddlJ2O9B7b6RwBsbDlcbJuyBKOF/m6iBh0ZVIg70sgS?=
 =?us-ascii?Q?BR4cb0AOm+3KkwcXUWhlIuyrKY1zfurHnW7PLI4qActKsvY59AYD19Fj0zay?=
 =?us-ascii?Q?c8yigC9fbn2MzMmBl+Kal3qmsj0HByyNFSy3+4YE2TAOA2QoGpG7YOEoff3w?=
 =?us-ascii?Q?ufxtzoPBed5ya8OVJ91yW/WSdBKhoFvwU6BVdEuWP69dz8EArR8yUzqeA+lm?=
 =?us-ascii?Q?ZuGBpjw4z9uxUGQdb9vvegNh0pMFw2iRm6WHKkekzttIdHXRtibRhgC8ZEb4?=
 =?us-ascii?Q?qpiJl3dqAhwPXi2t0r0xY+yq1f0gw/v3UlLgrkqneFikpYm1gjbtfsYBTZ4J?=
 =?us-ascii?Q?0k53NC6XKzMRO7QA6JzYOHGolQ0uBeUfcZg5qMWve2acquj5JQBBwqp4OsMG?=
 =?us-ascii?Q?Og+f42KUNqJOIpzbIEHplDwWzvtpGMKvoR3eVJZsXMghxQRxWhCAiWsSSz28?=
 =?us-ascii?Q?QDqWXc1TlD6t6bJS/7/ZcqhwOsXz/1jlz89IQdCRaD/JyPHLteEO2R3fgu9Z?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	XGWTdmMs2gv4GvP/T0aQWAswzuvf3f15STock4c9xtHqOiHYq+ZYEev+uOrj/tK+bhKzIvBlL0YTK8kasdbhPJmVojZATYOY2XeOJEP6QoSb0QcG9l/IBZcPxTjzs6nhP+pzz43HefcTNek9lrhiHn9eqv+uP9PrczC6Dr38atEi5EKovMUo3Bd4mg01rPuf8bWt8lPvFbHaUj1THZhspcmeeIpV7i4avYXgkFT+5V01QyDzAGNubzErTPUET0/TvZ1ZNuk+6FIyjNWiKeYcPOcFj/EU3e93JdSJSPW3FDYAAJej6qYGhB0Bkfj9O63vY9P/1ky8hgcSu6X0H8dx6n+lXx+JsDVi3MjIrkTGBbgzUDGmE48EsIlyFJRmJESG+NAjNcYnQusQmCB1m8MbSRXXpEvLQzGGpa9p7JM59RUQoD53OZuJfKwNvF1kjmCP7FnzKOZ6q9tSOBow6rmFzOchKpKwJwqGq6Nn4I/0FkxRoZhax2w0HS2l1YDJKL8YtnJK6UJBLZTRm7rPxBfU48ZpjORN6qmNLzhfHC1gsJnRdDzdT2opHmXYV1wQFfJ2ElxP3LlQysL10vstz/MUavoZIfb+yl4ZGoVUCp/J67k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee5e373-837d-4847-3d8c-08dc905d2cbf
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 12:41:43.9071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mvXTtlzXnQF0BqfgVJdprSLcDPtKwKTCpu345BE+NBfP9b9HrpqSqkl3ByCIdVyU6Tt51fSpt4tql8v8u+AN6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5585
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406190094
X-Proofpoint-ORIG-GUID: WX9YnHyn3-_9mdR24QBR20SRNLRAiESN
X-Proofpoint-GUID: WX9YnHyn3-_9mdR24QBR20SRNLRAiESN

On 19 Jun 2024, Kris Van Hees verbalised:

> This patch breaks generation dlibs for kernels < 6.10...  See bwlow.

Dammit, I tested this! But clearly I messed up the testing :(

> On Fri, Jun 07, 2024 at 07:41:54PM +0100, Nick Alcock wrote:
>> diff --git a/libdtrace/io.m4 b/libdtrace/io.m4
>> index e837ef65b86f7..aa406ec375698 100644
>> --- a/libdtrace/io.m4
>> +++ b/libdtrace/io.m4
>> @@ -1,6 +1,6 @@
>>  /*
>>   * Oracle Linux DTrace.
>> - * Copyright (c) 2005, 2013, Oracle and/or its affiliates. All rights reserved.
>> + * Copyright (c) 2005, 2024, Oracle and/or its affiliates. All rights reserved.
>>   * Licensed under the Universal Permissive License v 1.0 as shown at
>>   * http://oss.oracle.com/licenses/upl.
>>   */
>> @@ -11,7 +11,7 @@
>>   * to replace those tokens with their values to create the finished io.d.
>>   */
>>  
>> -/* #include <linux/buffer_head.h> */
>> +#include <linux/blk_types.h>
>
> This causing a dlib generation failure because this include is not sufficient:

Oh curses.

> The cause seems to be that you should add an include of linux/kconfig.h prior
> to including linux/blk_types.h.  And in all, including linux/buffer_head.h seems
> to be safer because blk_types.h says it shouldn't be included explicitly except
> to break include loops.

The real problem is that the set of valid includes can vary on a
kernel-by-kernel basis... but for now, I guess that'll work.

>>  #include <sys/file.h>
>>  #if 0
>>  #ifndef __USE_UNIX98
>> @@ -43,4 +43,5 @@ DEF_REPLACE(O_NOFOLLOW)
>>  DEF_REPLACE(O_CLOEXEC)
>>  DEF_REPLACE(O_DSYNC)
>>  DEF_REPLACE(O_RSYNC)
>> +DEF_REPLACE(BD_PARTNO)
>
> Thus reports an error when BD_PARTNO is not defined (and that is the case for
> kernels < 6.10).  Wrapping this in #ifdef BD_PARTNO // #endif might be enough
> to fix that.

Yeah, that's, uh, obvious, isn't it! I thought of that, he lies.

Fixing.

(And of course this is arch-specific. Does this mean that every
translation addition requires re-verification of translator generation
on every supported kernel, on every supported arch? Because that's an
incredible drag, particularly given that we have to do it under time
pressure.)

-- 
NULL && (void)
