Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBFC36E467
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 16:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771346127; cv=fail; b=Syhdj3qE4BQZXTHL1FOxRz1jTj3t+W7U03nCQ0CsEDradr1y6duLDDRS+UgRfM3bnDCXWBjJG8/eNhq/eigAMYAugBMdzK+TRE+9dMNV+L3jeWyvKjbzAVL0j/EtD7lmv4ucJvc+bjOEunrQbHi992qTGUir5bEsqIbF8tCbMUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771346127; c=relaxed/simple;
	bh=ET4Z0zZQDZq25IOgxZ1Ea/LFMEqywSec4AtJhMfBnJY=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=XkmUMXnHcGBuuZGPFjJf/HQ6jcwEMQt/KTLKiQ/RcFEWFwW6m3PXPVkHEDJAmmGq2CS1tQBODDfc7lPvcq3VO6+P5fUDDgjZpWklX6vEKGg1ZVBwTrSiUqIk8hRYzi5plfmb4+UPtT8F3EP1GdBV9hLktfxd0Udv2fElCCYyD50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=seLK8j0Z; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YV1aUJvS; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="seLK8j0Z";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YV1aUJvS"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HGNLJN495328
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 16:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=IOKAl/uYDIoPUucsDtHRQBOG9FsU5PVX8xOumvRnrcY=; b=
	seLK8j0ZoTc7w4bTR8igyUTxB2dvkWwb58ooFHlEAbM66XY+8mG/d0zTe115IsFb
	kMftIi3iN6RDTu8DsCSSSfJUkal0senhSDWYyEiJazAjYO5IsuLGGYFKHqUyF2aR
	hu/zFk82em4TGMm1KP96VvBMzIB7gnoTKKDSf/rTduMMRN4ALhtYXpDxEyoTgEKP
	8zpGNWLEB0UoSVHRZGx2bb7DOokVtMYGXtOn6VyRj+4eVpxB09sF5Vj7H7rw+1eF
	Q0jEY1wHw2Y8Sz8FvL90olAZxRGMIpGOL39BtckFLcSCFi6tK3Ij9KRH4nAV/qcJ
	pkZLM4dNHUpoMO9XBI13KQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj6mbwbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 16:35:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61HGDsBp006043
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 16:35:24 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010050.outbound.protection.outlook.com [52.101.201.50])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb22q62n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 16:35:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3d1IFSEFayuMKTfWoSKtNdKbYQhXVkAWjXiL64ZM+C4oy6qewkApeZgrMkcKszb2I9ddSu8iRehIwKyjRldlDNfgWmzVaEqR/QtQG1msW/+HSqNedLJxvYHNDetY89OcuiiuYYrROMMc5P7SB0eJqnbX0sqfw2GOXf9VpU4nUtOE69n3hygZH5SMpnntYQ+v1KcW4c7MgwwfMjODRze1aYGm9eFWmB7LGWRaiCoA92isJhIvlWiLxRC4HV7pGIr9hEZk3CRgRvxte4EHee1Nr8NAyf/p2604T7GL5UvZp+2ZEUBzYnuzCf1PqtIQStaLobKWso4gVv+wcm3SsZQdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOKAl/uYDIoPUucsDtHRQBOG9FsU5PVX8xOumvRnrcY=;
 b=DMda1wYow4J0dR4/iveLoPYIvn14NEdG9sGyZwfAaMa1OSFZ2YcQtKcp2V0N5DKMh+kJwzl/WyKOVvgHVF2QUFQHWuyNlbU8b53h80R6RL119d/J1ORlWZIJE8Cf9+Wk4313d7ro+L0wKQdh/OFRc5FkzyVuyu2ALKSeyRvSc0WEcdrxP+u59t6eisZsBYMnS2C6nQ8PHI7yZBdvLbDYy0E3wUEjP66gVSL6KjyJnwwSCHXEpB3C/+1nqKnlP16iv+VC9mN+R8JQAM4J1A7Madr0hd7dyv42fMhxAEO1nAcZxrHXT5MGmSCogLJdX5RUZYZHr6NaEj1zr9Ev/F5Pfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOKAl/uYDIoPUucsDtHRQBOG9FsU5PVX8xOumvRnrcY=;
 b=YV1aUJvSpNqcVbbAzS4OkNh5XAsSQXrWeHsI6yfjsQewPLpngjG69fejQ8W3r5y0FdLH9MA5XRjwSTpp+LVNpIbjv66lKTyDjLnUJwIat3OyI4wYElhXnK35/YSCZuatX/JJzy19bpJl/AdFPtrZcADm9muWX3EcizTwVF7OTsk=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CH2PR10MB4278.namprd10.prod.outlook.com (2603:10b6:610:7f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 16:35:18 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 16:35:18 +0000
Date: Tue, 17 Feb 2026 11:35:17 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] configure: add support for
 --(disable|enable)-dependency-tracking
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:36e::19) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522C462F5DF76BD9E145DEEC26DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CH2PR10MB4278:EE_
X-MS-Office365-Filtering-Correlation-Id: f2a9b843-ea51-4a63-d215-08de6e428904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b90+OIHaKmdeEeBkhVONHXyaBJHkPmliP9jnitWp9RWceiZ3L/XLmfpJhmfv?=
 =?us-ascii?Q?37SPaZegguZ1Mv/1grl5UKiMYIxuGh1heogiek7FfDZRtxjcRC37zOji7VPO?=
 =?us-ascii?Q?uJszLvK8LBnjM1hwHJlg2blJBVVB95WT+606yxSuk709vejvaW3xXZMIxJo3?=
 =?us-ascii?Q?eyLPkgek0UDDq6Ki+4mEpoSlcp/Tc7j2f9GSS7lYCfwe2qvXl1d/K2JI0Fxl?=
 =?us-ascii?Q?E679S5io+2Wg/vOA2w1seA9L9XNAKQR9iNHV1aDCcAIIyogWG9ZM+3yaPllp?=
 =?us-ascii?Q?lvDekHsEAZIMu5FKw7vd9Ni5kTZRUfW8KpnrmwNKhyKlHc8AnjVQ/Fvuf6LZ?=
 =?us-ascii?Q?KjF/oz2tQCyA/+fIym6ZAfyREXyZQowO6wM/2oP6+7cKieKdEOVUfbdIFJTN?=
 =?us-ascii?Q?NjNZ09tES1Gr3Br6rn8mwOzl0Ypt+2MSwZeof1ZxbSki747nuCeMfE9WYvkF?=
 =?us-ascii?Q?fFDeVKFvLCg1ApC/Qr+B4njkP6wqzGq0HKXiPh5Y/rfG58lzOXE9tEBI9ly0?=
 =?us-ascii?Q?hfGJaOhdV4ZbEWenAYDqWGULrTMKrsq/mZQaGVZj6FBBdUUgy+RxCxlhJwHX?=
 =?us-ascii?Q?2RjSe2FqVwN2kNyiZOZ957B6xWvShw0z+ovfwat3de06/faeY5ODknlefqP6?=
 =?us-ascii?Q?MPRM8SVNH1XP7TWiGO3nAaBfnO8q/r649JgwQ+5IMW7VAYz/Fu2+/L14/9Gu?=
 =?us-ascii?Q?VArAwk7k2R4afn9yFq0CtFIkGQ1Xd2SrWYdBKRX2wq2uzDwey0askl6II4HN?=
 =?us-ascii?Q?UBXFLGO9rRxKfPAudifwgDkefDk42SwxRHGL+RkG50C2MULAkdLAwoJXSmxo?=
 =?us-ascii?Q?PFfVBZS9m+Rk6rkj63Gp1THvboDKIPHV/RjgfRAIJ236E4EOsVAapvtcMQiL?=
 =?us-ascii?Q?2AZJ8lY8Dysl02u+nG+VN63QNLDTT4vcKQ91Rvo4Ffr29lcfUQ/CzQmQVjUF?=
 =?us-ascii?Q?GVN/qG5LSpsgrcsrTuhF1yqLbH9hzLPhwHyIRaUuHZYil5+DL7zybl8qvNaw?=
 =?us-ascii?Q?bYKIU6aKnqWB/9/iHTtXZb5/0Xfd4m4K6/eu56VqcbDAX3FdEawjw5RNGrQz?=
 =?us-ascii?Q?O0Obg0m2N62EJ4eJWwKUwgDo4E48iqygOyl9Fczx4isTZaMAgvkEMsrhvjrK?=
 =?us-ascii?Q?NCm/Kptt7gXcR01ky8IWvdbSbd0+X0DhpwJD2Jay67CpdRQyHmzjJGX4JzEJ?=
 =?us-ascii?Q?uZaSnWCSB4CEwxgwpHBlb7/EoJ2BWVqBj71zxbmLiZ/gjI4Loue4m04guOh7?=
 =?us-ascii?Q?hZiE30tBPq8nBkxkG+WIZ3pIjpacBdM9kLg06bPPZYCoHOlMXgE3I92PGbCc?=
 =?us-ascii?Q?CYYSETOVUqD/Mo9wKJYxo0PdZe1N4Qurk+CccYkVHKkjZ0pcfgFaGCz9r0b8?=
 =?us-ascii?Q?i10NRw8xw/ruRRWLV4oQDo1kDVMcwC9roW1P6TX0E6QbmsEQPXq6qbYdRova?=
 =?us-ascii?Q?Klbb47mf+NmVSSZ1IkRbhoYTGrWctOuXHhdhniPrjBA1QovWJ2TgEsl8BowV?=
 =?us-ascii?Q?i4A3Xijj3249MA3ZkfqmS/V0l+0JK/eybIdONycNJcHS+DK4U7hbo+iGfdhW?=
 =?us-ascii?Q?kYgjfQ9iomusPx4FhxA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B/F9vjdoiZLX2nbrvab0tyT8r0pOrLBhOvgqbd5E09s7q7UmvrUNIsCyL+2C?=
 =?us-ascii?Q?vJUHyxH2GjXzIrau3Woo5VVB/+xx+Eb9jcewU3iBqhtsxUDyszIv+Y3Ca3T3?=
 =?us-ascii?Q?IOxBXKpJQkFegPjSXa81MQovyEOqFSRzcxMiHx1NcWe/JV69/bSUXYWWjkPc?=
 =?us-ascii?Q?p6rO88l2+rojJrLFMKA9Oz1PM9C9Y2G8lzV4D+xmWtvr9mJJD3YqRzeB+6c7?=
 =?us-ascii?Q?faO8pitwZ+MXBdjxsowf86N2IsHLIGUsEbHhODfL6U06ABYDSqZ6Ool9dTdS?=
 =?us-ascii?Q?EcLdco9OPuqPlMEaOwzO/qWJuE4YGJlXGAGxsVTrFwcmg8+RO3ZUtmwXCXPo?=
 =?us-ascii?Q?BykQBBBzKXuGzdiBGCJvP5p5RfnK8z422SROfZEX/aH30HL21v8WU4OS2JP1?=
 =?us-ascii?Q?cFcJFS8UpuDKfH5KnMf8XPL8zgRzF+Vz6tf4mtX8mjbBAJw5m5rCxTLbVqc5?=
 =?us-ascii?Q?wfm0NmI1mI8QB7yl+/PFnfbgWX024B0+JERkhnB1R/oE47zgek+MKIYGvuD9?=
 =?us-ascii?Q?j6I+uxVSp2xOqrTzmn5HM30Xi9o9E7xGlfa8QKrgaAuncvrtB/xKDgRK7054?=
 =?us-ascii?Q?SPIHGoU9OISaeXZFrPcP/zA+7fPVyu5yJmkklRvYtxolxea/7hNlbPtnhQld?=
 =?us-ascii?Q?ZNADB0pWQ36NX+LgV36cPByHRTzChZKSZTMcoWOcNNISOwpZ0ygfjyjPNglk?=
 =?us-ascii?Q?r/OISY0G7cValL+ZZdccckoGj9o4pvUVIP20togg819oqmgyFhJelOvgKx9P?=
 =?us-ascii?Q?PoPE9LlAUMb/Qxd/cWFBOrnJaDtuPGsUu/bPpr5kfKe1RnuWOrc/598vRlo7?=
 =?us-ascii?Q?ZMbkJd4vP/L3+Z27Y5e5x2Dh/lA7Kfcwee+lESwGhi81hAsIPSiVYpK8KYWS?=
 =?us-ascii?Q?ahDVSCEmNcIyL3fJ9gv7uryqx6xMkk6pS0UuJpBCDpkoHPZS6RxL8ai5hJgn?=
 =?us-ascii?Q?RxqDP7bzP9yw/gR5sulEs3G0aYwk8myVfYTRQmnbP7wNFXR7HxgIMRGGcCN0?=
 =?us-ascii?Q?ut73KYBpQ8pFh1pNG6K6bK/Qb8UQ8H5OoSRngb7R5GC/BVvR6UvA/L7jOqZ0?=
 =?us-ascii?Q?y7pFrTegKX5DEokX0ul0CNxshLMVmF3a+4oGb/E18sfXvNKTcX0sRUMtVObE?=
 =?us-ascii?Q?3IORtMq64JGoukS6KHvcLbxbsFU0AyifXEe0G4HMMQtadYDj6Q/9oDiS0NQ7?=
 =?us-ascii?Q?dsJKxugp9NJpAEFxbIJFBHuXfcrYcGJlJciZ/qUIN2XXI1drqk/3V5r0NmSa?=
 =?us-ascii?Q?kpbWba3qH55ciL5y+OKBI6CHAsl525K0w1rZXYSkJQi3epkw76CqS6qgdULn?=
 =?us-ascii?Q?Ge4QEB0xr4kKi1e/gp2/CJcaOWSZMessoCyXZ1wMbOf5qKsb1IMAGEM21JsK?=
 =?us-ascii?Q?UvKWPWKB7U/+pfqQ9FcosmdBuJAEeEbEw6gGebVuaOiaMZisfbRrsBxr67cI?=
 =?us-ascii?Q?WMtAW6Yxrly4SPw4EENyxAJ7FDBzxF5cPLaUhabpRQARChcoRG7ijsgUZ0s5?=
 =?us-ascii?Q?sLm8oYgjTr0hUMGtaEvMpw2E9YRGccQIIMZFpvxLdjGbrWwTcTxtp6+9H5Ol?=
 =?us-ascii?Q?k46Q6OFpNveYzfvKXS2sEgtWcfO8DKruRQcX0vAwlRoXbG3gdZ7gHhdZ+zfD?=
 =?us-ascii?Q?CtF7aITJYvSsLBYPAfS80bBwdUR7oKAmm5I+J0/JyKYfQI7L5BH5ww1k4fsu?=
 =?us-ascii?Q?FGWGQ0JAKSawxeIq18Y/FGriMnPDNifW3pmR/m7p4qR6+1CBbM8bOjob6FbL?=
 =?us-ascii?Q?44zKr5XVng=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jXtLYz32IZpzfd9Kk2OaqTth7fFFMunSLQTwVvzfJKcl+JHreidlibUK3GxSyh/yF09ItDMnWV/azFjIb/162E0/XnFTvwnOfalE7a5E3hTkN+ymFanbrqfTiaGshjh7o+ZbqnIaI/J3mwiU4W0OPIzzG0R/Yyg+PfYzCeA0XCGXOtFZsvLzp3yqT+eqXltb4XbnDEJTgv8NQMY0sVQpJrDWTF16zebqt8eEjhg1FnjoDDaAaqUhLkbr19SYQPqH4wSMPZuLpjPg15/XaEvxHWDvFBCFCjuAqKs/d2fBW5T9WxEyQ2WehwmRT2JZmSFqzPC2s7M4KjiOgVpxZSdNbowcrbTVOYAvowKwLWcesBmM+EXldxlzVk3nRNwvoonhesLRAa1jnNbcDu/2byuigFqpyDNc4AD4dV1J9OiKKyWGH7q6fwyg3T2Zo8+u2qRqaTK0w8Y5aggvQY2j+DKnMAB6GshaXQBvEVhQHLLBDx5boE8wGljvvMHJZ92fUR+4CeDoK8f3cpr01IrWqebI9eLc6YPrkcljEw897SwAddFr5ysejfrUJDn1C3xx0GYwps9CarMNolTBjoV53fn32g+TE14obZcfY+9dvscx41A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a9b843-ea51-4a63-d215-08de6e428904
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 16:35:18.0030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzuQdf7BlKdeBIVj2AQ3dVjAMgwSAHNH8RU/X6RnIjsPd7312a6xFvkAecZpB8Ob/a82ngkZf9KQZP6qrvZ/oq3tRuO3VEA/abwL3WkyIMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4278
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602170135
X-Proofpoint-GUID: iAZsvfq69nYSHcQkZK5O8J_wwXCkoKG-
X-Proofpoint-ORIG-GUID: iAZsvfq69nYSHcQkZK5O8J_wwXCkoKG-
X-Authority-Analysis: v=2.4 cv=JO82csKb c=1 sm=1 tr=0 ts=699498cd b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=ehgjyNv0O7IsXLCgqOcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEzNSBTYWx0ZWRfX/BmJgq1747OG
 ftDZCLSivxBRPXnx8UGeljwCWrkzI12Pq+LcDnd/zi+LrrUEApEizcWQcRSRepatHCop4wQZ4S8
 VvHATzZ33RcY1WPUntdkyQcpSmvPtM0sucTFN5U4nLbTf+uC1FM74AUN74nbGLqwx29pstUvXO/
 FfUJZymCTTGbgpHanObL6OyWzE/QpF9FiLTx3JU4X8k4TZiCekTBxLFCRfanCTQwQeaXoUhCbLF
 84jihMpG0dHh6hbNAdLKakxD70M72818w7PjUdtiIz7GOccSKKAEHWRT79P1gZk5CV80SZ3urPq
 AlXz74CUhQm1rQQW2YDhrGRSid2rZboG7qM7/wfh2CF8A8SjbEc7FJs0HSzMLxg/KfEbbhuea7v
 qFXPWXjp3Q+KONPh9EEfwT3MO+5xIKtOsAgVfDvO8/Q6C6a6snu4IcvPcUo66/H74SaoKfcs3v1
 kica6/jKWXsmV1P45Cg==

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 Makefunctions | 2 ++
 configure     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Makefunctions b/Makefunctions
index 15836dc3..1f308967 100644
--- a/Makefunctions
+++ b/Makefunctions
@@ -52,7 +52,9 @@ endef
 # Rule to build a C source file.
 # Syntax: $(call cc-template,primary,filename-without-dir,optional flags)
 
+ifndef WITHOUT_DEPENDENCIES
 cc-dependencies = -MP -MMD -MF $(obj-name).deps -MT $(obj-name)
+endif
 
 define cc-template
 $(obj-name): $(src-name) $(foreach dep,$($(1)_SRCDEPS),$(call src-name,$(1),$(dep))) $(foreach prov,$($(1)_PROV),$(call hdr-name,$(1),$(prov))) $(CONFIG_H)
diff --git a/configure b/configure
index 04c28369..fadac05e 100755
--- a/configure
+++ b/configure
@@ -172,6 +172,8 @@ for option in "$@"; do
         HAVE_VALGRIND=*) write_config_var VALGRIND "$option";;
         HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
         HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
+        --disable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "y";;
+        --enable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "n";;
         *) echo "Unknown option $option" >&2
            exit 1;;
     esac
-- 
2.51.0

