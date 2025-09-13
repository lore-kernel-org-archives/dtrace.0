Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B246405F7
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 00:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757724624; cv=fail; b=APVHTMqP6jzPCFSn8x2EjfEYDitzgqPv79QxM+ljGkkLQrTfWL8bdA5LzUyG/vFPufthps+tHe4lz6pM4KGJXRuCg/swBSuLhh2aEW0Ai2Hq9uH+eS2mZ9mboLelV1HChhbVViynUnWdPxTNBy8Eb/HWkgIz0a7VyWL4x+QpaPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757724624; c=relaxed/simple;
	bh=YNXaZ1RC8qLaEB7DVG2hn7wgs8NJ8EyHQNT/dauisNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jvKMQnuhZoJZZWqoyGT9qpbL00W17004pWWsRz3a90hAAJuoBHwWiY6EndEUYyNlPA86wLNpDOt/c92fKtrtcVd8MAAa/SUkP/Jhth5J0RVBJX5Ic+NlYWw8lY3/fxOsN5WpXsOqfhAaLd7rVk9+NaCi2SpD8po7jX97VZGa7ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SndwE6EM; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=upy4Bt/u reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SndwE6EM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="upy4Bt/u"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CLg4lH001899
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 00:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=uqEOX7S3L3IyHKYc63HMORuSG/7OlHjBcWr4acKBgf0=; b=
	SndwE6EMpAe0cscRrN2ctiVYfZuAmTrXnE+NLZK6MLwhyrYdRQx6BDfh55Q5sFsN
	V2o6Oy2CGhzB5zI9iAU2+6Z1z53cK3sjs3HSRX0NxczY5GZJQ0lSelkloPh1TNRr
	XpEcZ4EJNSP7ihQNz1Zjap/E805rnq3DlW4XtVEa9NbBIV95fhlHikAphXD9eh0E
	/1b586HX9sc+MluWEnUMwacyvlikePJc4AFJwghvWYjDEM3YtstpYpVxWOlPBWJO
	uUTUUHieP43oLPrtGuUjXVfu9q9I/rVWMb/NOfeH5GkVeWVy1a+EyX305I9RNp/t
	0pXyozulyyEgOVK6KnbLZg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4922x994te-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 00:50:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58CL56dL012857
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 00:50:21 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010054.outbound.protection.outlook.com [40.93.198.54])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 490bdeq38a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 00:50:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUGWBeGnhY1ZNKKgR2mkxGRq+A9HI6on2+4a+QEFaYvQMwSJqqIO9f6oqFXfukw2SuqLGgqVeoCMUh4uN5fk/9dNwSC0U/Mdrt0+xeUFE6uMi4IDwrpO/2EzAfV9xScWMbEtFIN2lVWcNFUEAfKf22WjyxWf8dVG5ikfAzhVkilqGzLBEJ6cLdO2AtjocMVmQuBlHMOGuGOqrslFkMCLe0Bsr7ViHO/1hmdVlT76RnDZa9PGqnyIGs+iM/hfDE1wVs+dcY4K+T1Gc1Kk28fyCUrPLlNQiMzwQ6J9CZdJJxeHEXXJCh2fJNASiUC5NnpLkIILVVKgcU7YZTpLa8LUPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3AJ4Yd0fKYU6YIzZs5AHRW1oz6rpmGocUqKoSCpigc=;
 b=ipunKtJhVrj3bW45P4G1D1s5POr6YTe9e3kLmAT7Lh7NmSThFddB/evX/ZmMiroji5VkvNncXdy2l8U6ZxnJhmQQyD2VMJY+/+YW7W7O/uxrmvz2ZUFVnNAKeyAN4G2n1lWTq0XEJ2p17Qm7M/UwSVd99BdsEzb1boeoQJEQ7/uRT+/dmcQtNibfF/RMM+A9pemJj3KsMPycQkPANw/sKqauG+9wl9ouT1URpMtNwpnj75QI2up+ZOxvpHV79IUqBAu/dNyOjVf/FDoO48NHeRbf9s6svH711jSkBb26zTRhO0Z+HJP8yekU49cJtxEy875zoGUsjlVaqoNLFD5WDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3AJ4Yd0fKYU6YIzZs5AHRW1oz6rpmGocUqKoSCpigc=;
 b=upy4Bt/uxjT+P+GiyiIZz39D5CLOR3V9KWARYVmtApVhTmL060eXPDEZKs6oplIAWE2+zj3y6MKR9GqZH8q88zPFwCa683WDfR/WxLDX+g+jzI5Uq2ANMVV0hO2lCI/dSVGG+96YhQW2zhq6lQEl7u0jcu6kfOmAMxRRl9x2hP8=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CH0PR10MB7410.namprd10.prod.outlook.com (2603:10b6:610:190::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.18; Sat, 13 Sep
 2025 00:50:18 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 00:50:18 +0000
Date: Fri, 12 Sep 2025 20:50:15 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] trace: print alloca pointers as actual pointer values
Message-ID: <aMS/x6mbD+N17I1H@oracle.com>
References: <SJ0PR10MB56726ADFB2A8CBF47D3B8C46C208A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <e464c8fb-2f74-a3e8-4fa9-c9074c0e661a@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e464c8fb-2f74-a3e8-4fa9-c9074c0e661a@oracle.com>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CH0PR10MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c033964-cf72-45e1-0b4b-08ddf25f82a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?BR1BOvrlqWxf23ou6yJ+FcSvFfiff58bPhbzYnNnRpDCT9FKQV0wbJEONi?=
 =?iso-8859-1?Q?hz1ZqNp7RUTEPbQQosY7KDXPmJRcQTmuBpD9fVV4vCvE2thsKDKkigJCNO?=
 =?iso-8859-1?Q?N8nugaXx9p6CiWDrgGdl8TJg31SV7YJmskzsQM3Zm7LHUC9b+BzoQkW4gp?=
 =?iso-8859-1?Q?tnS8uueHUuWCRCC6p+wRIGL07SuipMU+ZuLZI9n9zB1Z0GJXYcEWlp8lXh?=
 =?iso-8859-1?Q?Lon+p+CEizx1FXjjzR7js/i9GoRi/iOwmfiupVUDZkTVoUjicTx5p/uaa3?=
 =?iso-8859-1?Q?r9Iads/vhC7tnPDdwuhTUcp1NPwAYAi5xrkDw9FP3jSClJlTz2Kpb0Oo4A?=
 =?iso-8859-1?Q?Fg5OYoqsF64Fxs9pb9m/hg9z3+fc8eloR9k1XMDLRyZplE1zqzhPjRzF9q?=
 =?iso-8859-1?Q?b4BtzjAWQd984fWswl+n21fVJU2lCh2zj2Peq8a5kZ+auWRAX2q8uC62Wx?=
 =?iso-8859-1?Q?Grros93FD2gWZ7xGvntu5WkdJM2hTSnx7SlfHGHkWLgL/s5YL0/AUC4Rfg?=
 =?iso-8859-1?Q?WobBOcReEUDkart8heVLFAtHvsrtZo2hFrnExnL/wS/Za+IFbVEitaCiDS?=
 =?iso-8859-1?Q?SXd2ZuyZnNicvoWAYUzjfY2zmpyaSGk5hsUcWy6ZFfpWR0Ax539/reoDPa?=
 =?iso-8859-1?Q?XrYxq8hlEvZIzi7o7Xgi/UCi3PsheqSRWbbJOK/7Ho52L23TwaRIUdWwTI?=
 =?iso-8859-1?Q?VORPR8E0eyidah6hQvz4C0ddIExaVw0oy4lzZAS7pwqMIk2fRd5J9fFboh?=
 =?iso-8859-1?Q?qwA+01jDPvtUFlW72XtPByuN+8Mtxd3mLZPJVgaPjyZ0aLmkd2HPAfV72S?=
 =?iso-8859-1?Q?mF5L0d/We4ANyGfCHiXXDWUE6xdPK3rFBkR5zJM1OeihFDnYvo4YCCu+Z1?=
 =?iso-8859-1?Q?Feup6oG85IXgzPVnTGBIrzR0Kt48kzNbTxtdmDOABZjImiGFJmWCF47Ltf?=
 =?iso-8859-1?Q?LMJQXBYVvMtuH8cluTcG71uC7O1CpbK4pOSSaDuA2hyEdF7f0hNH7Irnn2?=
 =?iso-8859-1?Q?A1aGNhvFtRcMheqemQfrPC23Rng4C9CGN7CAoG01gDeCxT+C3lhsB6wJoQ?=
 =?iso-8859-1?Q?0NFbLw/gYKpY2vTC05xkkTizZh5fvP31WSwibMMAyUrfPiqbcuitqyPXvl?=
 =?iso-8859-1?Q?REAqlGmbyqJnLLLvq3CHg3p9Ui+LhMwmI99Cskw6wPlzIBr6ppZ/uD35Xs?=
 =?iso-8859-1?Q?aTiWQsHcN0w1B05xH3KqMMJQgkoQruKvx+D8bxHdbOSb9RmN3ZQYaBRpGe?=
 =?iso-8859-1?Q?coXxRpPGoQSJCkQPQobHmI64c0yS1GhjYZEm1zs5+obIy6+brG2FpcyKmd?=
 =?iso-8859-1?Q?7CGs/ev04Tk7l7eEatgs7c4aUmtHM2s2l8mOSTiQTD9p+wxwlnXf6NMRBG?=
 =?iso-8859-1?Q?4mMZxIAbruzbW5qqggvNMfZBQ4mo2A7CFF2aCsMC6dAlrin5zyTJ7HfOI1?=
 =?iso-8859-1?Q?YWC9e6S7I4qrb/NPNZzaI49tH7azqMWEcILIxDGMK4KVGDbrwOU+xSJGj4?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?AIqCeiKNFQPEyjkkx+UUgHhq6q/aXWnEUR1+ZA4Yki7aAmSFqRf8CsOehP?=
 =?iso-8859-1?Q?UdIdkFZv1EqQMyRfmkIiGfMJfxLL43wka3VNQfb8cCYdgHXfbxVxhrRlCm?=
 =?iso-8859-1?Q?5JRyxWSjsgdxeO43gwCd1rwIaopShUZq+o/MHtLPYqs7VMfkdaztq4lMLk?=
 =?iso-8859-1?Q?1W+muifSKzNX5i2Xx0ayWsy12L+o7HAJgMNWUfGAd5Pm74Y3BKS3vLQgCt?=
 =?iso-8859-1?Q?vJP0BDQSjVQvkrl+/ke3cZvG47m5Vn0D0X1/C2K7T3lAax0YhYOEaSoRWr?=
 =?iso-8859-1?Q?B3p2SutpcIIJJGx+fQzlMJIjAbRJ8HQnJgPtPLxvEGjhAxXl7trFYURCSJ?=
 =?iso-8859-1?Q?C5bCgJArwMwTBD5A9foJNr0I8nOl/m+C8NIIIG+nq1gle1moAG7RmzEQB6?=
 =?iso-8859-1?Q?cG/D80Pqia6i/N75cab/q2igOHRP7yMT8dFbKnS6mZpiNSnK8z91dYodlT?=
 =?iso-8859-1?Q?g7pHLgGSiOgY8dhjOtN+YpKeO2bVRrchvT9q8DNdooV7PRbVwRCNGUwBLx?=
 =?iso-8859-1?Q?o6orpjzqnGnVLhE7uBkKIrjgG2AerzWGiR2b/pr4fvxDjVv/GR4hPuGxdv?=
 =?iso-8859-1?Q?UDICVR9wFgqokbur6JUQMCg7kDcPkm4dPn16mWFIxFPLTsjjGf/m3bVbl8?=
 =?iso-8859-1?Q?KsPX1JR/A1GmW7oxZ0KXwdrpHY2QHpFt84D1hCaSuXALEk1hO+huWrEUJS?=
 =?iso-8859-1?Q?KZF+XgVZOUeV02HsL373xCwboSNtmPcI5LYwpwTXdm7zHUM0NPLPIqwm6D?=
 =?iso-8859-1?Q?g5fise8x1VRwzYAc7ep2Lli40yyGNNSCt9tFn5QxmJcaKPdBDOT2C5NMlL?=
 =?iso-8859-1?Q?FVGjSkxFUtPX7OwDtCiAB5FnXdbg14OUqAdbQUu/a+pGRIPJypV+kXgn28?=
 =?iso-8859-1?Q?M8DWWCCMPgavUk+xzsvz+eD594DhiiIOrpoTq0gniH3Ue/xDgIHwk3p3YY?=
 =?iso-8859-1?Q?oS3Mj6Fr2FEJykfOU9bQBLJpRuo7QxQYaTOum72H0YEiH5UQvf0skcwVbe?=
 =?iso-8859-1?Q?JkSmD8yQn4NMmWhU/BQ7hBXWqKyDOGOw3zQIMru35VYuNYqB1nKagakW4/?=
 =?iso-8859-1?Q?DEt1kuKAUpuAjC2PPRT6mztABCGhBYnK3t6J5/IBv0bXC4wpOFIdzMXSPj?=
 =?iso-8859-1?Q?/r67QwlXp4oXqaXWWSWQTQF58edOJ6uyvV2krSZpatHxrt5lUahZpG6bXv?=
 =?iso-8859-1?Q?UfWpRHitEQjAxIkJFM8wEvJYecpegar4/Z8Jgo1nPkBm0v+p7Dt+JsyXrj?=
 =?iso-8859-1?Q?PM2Ncc7SRCQz/mXa6caiLLqmiFqCQJyUXF8WsTBvP85R3mDItP3qMLOPH/?=
 =?iso-8859-1?Q?WaVG85aJJD/C9bq8yNpIxlzRRxNe1jqB90895CdzIupECkOOCplOiTX4Gs?=
 =?iso-8859-1?Q?BsGmZjD6Rlh1yuYIqUPs909Yg3S4catIiC5xjKcrzdRJF+UfpnBT6rW/o/?=
 =?iso-8859-1?Q?ZotlOuDUTlP13vsX6fJtUgOsmPn0iB9ywzrbEdnyzvbM6O4KC6AritP4pl?=
 =?iso-8859-1?Q?Eo4UTyVNrS5VVYBozl0qQjp7xrw3Z6GXf5eKgFGP/vJ94HLeiZKZQ5sZ6a?=
 =?iso-8859-1?Q?LqPsMNXaTyAcRg0jlSiyeRha+phm/cOw1dJRCq4oiRATmRGINPEwh/M3l+?=
 =?iso-8859-1?Q?KHc6B4am2eyyb95FrnMrYcNJVKk2RipLQPjgmmvBvo22HievPCM5X3tg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LjKn1ehWP5hz1rqjnXK1+L/uDzJJibZyBHMbicazfKExlu8uBfrTDYGLxfDMy2lafVDIpE9pQSAD7AoXmhzGVdTuT2DkLG0Yk9CzW5XHjixhulxmh7NbSmJns8imxi1p/s9sPCeANXlzTiPa0mu/bJa3WQTC1C2IVD2LtDyGSb+wf4nD1jpGIa33unfSA7MdX3cRLpZoY7bH31zkEl5cmGefXazMf1XsYOfvRkoPIu2vPXpdfD+vetex+OPWhfln2Fx/lHJkI2IG+oRS0jTK4NmzLGUc4Tmqtz5N5BdxQleTOyYRQgGtPSsr+GjhkJRITb6FuqXD7KUpAcEFUlqskK6KVm/EFPZNKSL5HR9ecHQPRmaGoQe2YoxAWY4xXYEdUNZNW5wXkj8+yZtcWfgrC/Mtp61ROhMuG7I3/oKIGL8MS4NbSjFhTBZsmFCSR0l06/nWE5iBGEa9ZlsI8YsoKpAhFaDdHZIgVW2sIulMKJzrMv7jBpp2R8rYIFDqoM4r+NSEfKkRi6/d1I2L8fvviDhKLKoTE6t8xhhjuMq6avaI2vARo2xMkGdJQBXD3GSIl8KK6EE+njdq23Fgrf6Af+R/1+nGoDazQZHr/GCi1p4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c033964-cf72-45e1-0b4b-08ddf25f82a8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 00:50:18.6513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBLkWKG7asRADS6BAjBnGPcZaD/6m0NgsXdpH5cSkpcCiAmDLym2EhSRqQK1k4RdVxD0Cw723/ag4qpVx24AI/tbrveur1yfNRnqUSGRoIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7410
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_09,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509130005
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDE2NiBTYWx0ZWRfX6/Zl3PENbW9r
 bTUIaGO94ml89WgvOPu0xxfjUBIl4RiGTtyJzb+HmY04ps91yl6ET9AhdAWREK6llhkDc8iQbIe
 kIbB2GpN3WUGWNotnIwVN7ih/Zbpd8u0S4E+LNANtYy11mDMBgLCrxhlsxNT8EUok4/2E4214cO
 j9/XCVBFpkTxnKZONc643ZemsG67F/VBojy+fJq104vkDg37rT70boWCaZdwTvngBcEiPL6QLzD
 pjRR4edv8cLdauI2wBdGFzTDHfpOmGy1FwsP0+WMTb656mBQ2bKKDrMeFWbXu/3GYSGxfARZPx6
 C/8CfT9iXRvO1wwziwiyJOXDoxZM4W+ZqsBDnvK1i+rHOX0aBFHYxds1RDVBKWHIP4jqlBXo9tI
 lvIkOki4
X-Proofpoint-GUID: U7gnvunEzqLTPDmQx2U3kVTsbfbiBVs5
X-Proofpoint-ORIG-GUID: U7gnvunEzqLTPDmQx2U3kVTsbfbiBVs5
X-Authority-Analysis: v=2.4 cv=LYY86ifi c=1 sm=1 tr=0 ts=68c4bfce b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=neJ-cPMDMMqBLMyykL0A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10

On Fri, Sep 12, 2025 at 08:36:19PM -0400, Eugene Loh wrote:
> Similar comments to v1:
> 
> On 9/12/25 00:16, Kris Van Hees wrote:
> > Because alloca pointers are stored internally as ofssets into the
> 
> Again, s/ofssets/offsets/.
> 
> > scratchmem area, they were printed as small integers.  They are
> > now printed as actual pointer values into kernel space.
> 
> And again test failures.  This time, not with the new test, but as you say,
> "Ah, tehe joy of fixing one problem only to uncover another."  So this time:
> 
>         test/unittest/funcs/alloca/tst.alloca-funcs.d: FAIL: expected
> results differ.
>             Diff against expected:
>              a/b
>             -8b11/b/b3a/b//baba
>             +18446671313727729520b11/b/b3a/b//baba
> 
> Here, "8" has become "18446671313727729520".  So, need some .r change (and
> some .r.p magic and possibly .d tweak).

This is resolved by the other patch about subtracting pointers.  With both
patches, this failure is no longer.

>         test/unittest/funcs/alloca/tst.string-alloca.d: FAIL: expected
> results differ.
>             Diff against expected:
>             -abc
>             +
> 
> Here, simply a bug?

Hm...  This passed on my end somehow.  Let me look (perhaps I forgot to include
a change when I prepared the v2).
